
dev_null_item:
  type: item
  material: barrier
  recipes:
    1:
      type: shapeless
      recipe_id: dev_null_1
      input: material:apple|material:cobblestone
  display name: <&r>/dev/null
  lore:
  - <&e><&l>Left click<&r><&e> to set item.
  - <&e><&l>Right click<&r><&e> to reset.

dev_null_handler:
  type: world
  debug: true
  events:
    on player clicks dev_null_item in inventory:
    - define new_current null
    - define item <context.item>
    - if <context.click> == RIGHT || <context.click> == SHIFT_RIGHT:
      - define new_current <item[air]>
      - define item <[item].with[material=<[item].script.data_key[material]>]>
    - else if <context.click> == LEFT || <context.click> == SHIFT_LEFT:
      - stop if:<context.cursor_item.material.name.equals[air]>
      - define new_current <context.cursor_item>
      - define item <[item].with[material=<[new_current].material>]>
    - determine passively cancelled
    - stop if:<[new_current].exists.not>
    - flag <[item]> current:<[new_current].material.name>
    - define item "<[item].with[lore=<[item].script.data_key[lore].parse[parsed].include[<&e>Current Item<&co> <tern[<[new_current].material.name.equals[air]>].pass[None].fail[<[new_current].material.name.to_titlecase>]>]>]>"
    - inventory set d:<context.clicked_inventory> slot:<context.slot> o:<[item]>
    on player clicks block with:dev_null_item bukkit_priority:highest:
    - determine cancelled
    on player clicks block with:barrier bukkit_priority:highest:
    - determine cancelled if:<player.has_permission[this.is.not.a.permission].or[<player.is_op>].not>
    on player picks up item:
    - if <player.inventory.contains_item[dev_null_item]>:
      - define devnulls <player.inventory.slot[<player.inventory.find_all_items[dev_null_item]>]>
      - define items <[devnulls].as_list.filter[has_flag[current]].parse[flag[current]]>
      - if <context.item.advanced_matches[<[items].separated_by[|]>]>:
        - determine passively cancelled
        - remove <context.entity>