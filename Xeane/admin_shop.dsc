admin_shop_data:
  type: data
  formatting:
    price_lore:
      - "<&e>"
      - "<&e>Price<&co><&a> <[price]>"

  # Individual Shops
  shops:
    # Shop Name (used in flag after NPC assignment)
    banner_shop:
      # Optional field
      #custom_title: none

      # All items in here
      items:
        custom_banner_pride_rainbow: $60

admin_shop_assignment:
  type: assignment
  debug: false
  actions:
    on assignment:
      - trigger name:click true
    on click:
      - if <npc.has_flag[admin_shop]>:
        - run admin_shop_open def:<npc.flag[admin_shop]>

admin_shop_buy_button:
  type: item
  debug: false
  material: green_wool
  display name: <&a>Purchase
  flags:
    run_script: admin_shop_buy

admin_shop_inventory:
  type: inventory
  debug: false
  inventory: chest
  title: <&color[#000001]>Placeholder Title!
  size: 54
  gui: true

admin_shop_open:
  type: task
  debug: false
  definitions: shop_name|page|selected_item
  data:
    player_head: 5
    item_slots: 11|12|13|14|15|16|17|20|21|22|23|24|25|26|29|30|31|32|33|34|35
    next_page: 54
    previous_page: 46
    selected_slot: 41
    buy_button: 50
  script:
    - stop if:<script[admin_shop_data].data_key[shops.<[shop_name]>].exists.not>
    - define inventory <inventory[admin_shop_inventory]>
    - define data_script <script[admin_shop_data]>

    # Define our initialization data
    - define page 1 if:<[page].exists.not>
    - define title <[data_script].parsed_key[shops.<[shop_name]>.custom_title].if_null[null]>
    - define slots <list[<script.data_key[data.item_slots]>]>
    - define start <[page].sub[1].mul[<[slots].size>].add[1]>
    - define end <[slots].size.mul[<[page]>]>
    - define items <[data_script].data_key[shops.<[shop_name]>.items]>

    # Build and Set items in Inventory
    - foreach <[items]> key:item as:price:
      - define itemTag <item[<[item]>]>
      - if <[itemTag].lore.exists>:
        - define lore <[itemTag].lore.include[<[data_script].parsed_key[formatting.price_lore]>]>
      - else:
        - define lore <[data_script].parsed_key[formatting.price_lore]>
      - define this_item <[itemTag].with[lore=<[lore]>;flag=price:<[price]>;flag=run_script:admin_shop_choose_item]>
      - inventory set slot:<[slots].get[<[loop_index]>]> o:<[this_item]> d:<[inventory]>

    # Player Info Head
    - define lore <list[<&color[#010000]>Placeholder]>
    - inventory set slot:<script.data_key[data.player_head]> o:player_head[skull_skin=<player.skull_skin>;flag=shop_name:<[shop_name]>;flag=page:<[page]>;display=<&e><player.name>;lore=<[lore]>]

    # Selected Item
    - if <[selected_item].exists>:
      - inventory set slot:<script.data_key[data.selected_item]> o:<[selected_item]> d:<[inventory]>
      # Buy Button
      - inventory set slot:<script.data_key[data.buy_button]> o:admin_shop_buy_button d:<[inventory]>

    # Next Page Button
    - if <[items].size> > <[end]>:
      - inventory set slot:<script.data_key[data.next_page]> o:<item[leather_horse_armor].with[hides=all;display_name=<&a>Next<&sp>Page;flag=run_script:admin_shop_next_page;color=green;custom_model_data=7]> d:<[inventory]>

    # Previous Page Button
    - if <[page]> != 1:
      - inventory set slot:<script.data_key[data.previous_page]> o:<item[leather_horse_armor].with[hides=all;display_name=<&a>Previous<&sp>Page;flag=run_script:admin_shop_next_page;color=green;custom_model_data=6]> d:<[inventory]>

    - inventory open d:<[inventory]>

admin_shop_next_page:
  type: task
  debug: false
  script:
    - define info_item <context.inventory.slot[<script[admin_shop_open].data_key[data.player_head]>]>
    - run admin_shop_open def:<[info_item].flag[shop_name]>|<[info_item].flag[page].add[1]>|<context.inventory.slot[<script[admin_shop_open].data_key[selected_slot]>]>

admin_shop_previous_page:
  type: task
  debug: false
  script:
    - define info_item <context.inventory.slot[<script[admin_shop_open].data_key[data.player_head]>]>
    - run admin_shop_open def:<[info_item].flag[shop_name]>|<[info_item].flag[page].sub[1]>|<context.inventory.slot[<script[admin_shop_open].data_key[selected_slot]>]>

admin_shop_choose_item:
  type: task
  debug: false
  script:
    - define stable_item <context.item.script.if_null[<context.item.material.name>]>
    - inventory set slot:<script[admin_shop_open].data_key[selected_slot]> o:<context.item.with[flag=item:<[stable_item]>]> d:<context.inventory>

admin_shop_buy:
  type: task
  debug: false
  script:
    - define item <context.inventory.slot[<script[admin_shop_open].data_key[selected_slot]>]>
    - define price <[item].flag[price]>
    # Server Currency Purchase
    - if <[price].starts_with[$]>:
      - if <player.money> >= <[price]>:
        - narrate "<&a>Yay, Purchased!"
      - else:
        - narrate "<&c>Insufficient Funds!"
      - stop
    - else:
      - if 0 >= <[price]>:
        - narrate "<&a>Yay, Purchased!"
      - else:
        - narrate "<&c>Insufficient Funds!"
      - stop