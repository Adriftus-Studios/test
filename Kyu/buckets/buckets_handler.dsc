# -- BUCKETS
buckets_handler:
  type: world
  debug: false
  events:
    # General
    on player fills bucket priority:10:
      - determine cancelled
    on player empties bucket priority:10:
      - determine cancelled

    # Milking Cows, Mooshrooms, and Goats
    on player right clicks cow|mushroom_cow|goat with:bucket_*_milk_half|!bucket_*_*|bucket_*:
      - ratelimit <player> 2t
      - define item <context.item>
      # Empty Wooden Bucket -> Replace with filled bucket
      - if <[item].script.name> == bucket_wood:
        - inventory set slot:<player.held_item_slot> o:<item[bucket_wood_milk]> d:<player.inventory>
      # Filled Bucket -> Cancel milking
      - else if <[item].script.name.advanced_matches[bucket_*_milk]>:
        - determine cancelled
      # Empty Bucket -> Replace with partially/half filled bucket
      - else if <[item].flag[quantity]> == 0:
        - inventory set slot:<player.held_item_slot> o:<item[bucket_<[item].flag[material]>_milk_half]> d:<player.inventory>
      # Partially filled Bucket -> Do logic
      - else:
        # Add 1 to quantity if less than maximum capacity
        - if <[item].flag[quantity].add[1]> < <script[buckets_config].data_key[<[item].flag[material]>]>:
          - inventory set slot:<player.held_item_slot> o:<item[bucket_<[item].flag[material]>_milk].with[lore=<&e><script[buckets_flavor_text].data_key[<[item].flag[material]>]><&nl>|<&6>Quantity<&co><&sp><&e><[item].flag[quantity].add[1]><&6><&fs><&e><script[buckets_config].data_key[<[item].flag[material]>]>].with_flag[quantity:<[item].flag[quantity].add[1]>]> d:<player.inventory>
        # Replace with filled bucket
        - else:
          - inventory set slot:<player.held_item_slot> o:<item[bucket_<[item].flag[material]>_milk]> d:<player.inventory>
        # Play sound to mimic milking with empty bucket
        - choose <context.entity.entity_type>:
          - case cow goat:
            - playsound <player> sound:ENTITY_<context.entity.entity_type>_MILK
          - case mushroom_cow:
            - playsound <player> sound:ENTITY_MOOSHROOM_MILK
      - determine cancelled
    # Drinking Milk
    on player consumes bucket_*_milk*:
      - define item <context.item>
      # Offhand slot is 41
      - if <player.item_in_offhand> == <context.item>:
        - define slot 41
      - else:
        - define slot <player.held_item_slot>
      # Subtract 1 to quantity if bucket has quantity
      - if <[item].flag[quantity].sub[1]> > 0:
        - inventory set slot:<[slot]> o:<item[bucket_<[item].flag[material]>_milk_half].with[lore=<&e><script[buckets_flavor_text].data_key[<[item].flag[material]>]><&nl>|<&6>Quantity<&co><&sp><&e><[item].flag[quantity].sub[1]><&6><&fs><&e><script[buckets_config].data_key[<[item].flag[material]>]>].with_flag[quantity:<[item].flag[quantity].sub[1]>]> d:<player.inventory>
      - else:
        - inventory set slot:<[slot]> o:<item[bucket_<[item].flag[material]>]> d:<player.inventory>
      # Remove status effects to mimic drinking milk bucket
      - adjust <player> remove_effects
      - determine cancelled


# -- Configure max stack size for bucket.
buckets_startup:
  type: world
  debug: false
  events:
    after server start:
      - adjust <material[bucket]> max_stack_size:1

    after player clicks !bucket_*_*|bucket_* in inventory:
      - inventory adjust slot:<context.slot> quantity:1 d:<context.clicked_inventory>

    on player clicks !bucket_*_*|bucket_* in inventory with:!bucket_*_*|bucket_* action:place_*:
      - determine cancelled

# -- BUCKETS CONFIGS
buckets_config:
  type: data
  wood: 1
  iron: 2
  diamond: 3
  netherite: 5

buckets_flavor_text:
  type: data
  wood: A small wooden bucket.
  iron: A sturdy iron bucket.
  diamond: A big, sparkly diamond bucket.
  netherite: A massive netherite tub.
