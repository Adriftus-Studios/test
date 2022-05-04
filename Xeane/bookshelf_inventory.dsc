bookshelf_inventory:
  type: inventory
  debug: false
  inventory: chest
  size: 18
  title: <&a>Bookshelf
  data:
    on_close: bookshelf_inventory_save

bookshelf_display:
  type: item
  material: bookshelf
  display name: <&a>Bookshelf
  flags:
    run_script: cancel

bookshelf_inventory_open:
  type: task
  debug: false
  script:
    - stop if:<player.item_in_hand.material.name.equals[air].not>
    - define inventory <inventory[bookshelf_inventory]>
    - inventory set slot:5 o:<item[bookshelf_display].with[flag=location:<context.location>]> d:<[inventory]>
    - if <context.location.has_flag[bookshelf_inventory]>:
      - inventory set o:<context.location.flag[bookshelf_inventory]> d:<[inventory]>
    - inventory open d:<[inventory]>

bookshelf_inventory_no_piston:
  type: world
  debug: false
  events:
    after server start:
      - adjust <material[bookshelf]> piston_reaction:block

bookshelf_inventory_on_place:
  type: task
  debug: false
  script:
    - flag <context.location> on_break:<list[bookshelf_inventory_drop|remove_flags]>
    - flag <context.location> on_explodes:cancel
    - flag <context.location> remove_flags:<list[on_break|remove_flags|bookshelf_inventory]>

bookshelf_inventory_drop:
  type: task
  debug: false
  script:
    - if <context.location.has_flag[bookshelf_inventory]>:
      - determine <list[<item[<context.material>]>].include[<context.location.flag[bookshelf_inventory]>]>

bookshelf_inventory_save:
  type: task
  debug: false
  script:
    - define location <context.inventory.slot[5].flag[location]>
    - flag <[location]> bookshelf_inventory:<context.inventory.map_slots.exclude[5]>