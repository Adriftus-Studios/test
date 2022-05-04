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
    - define inventory <inventory[bookshelf_inventory]>
    - inventory set slot:5 o:<item[bookshelf_display].with[flag=location:<context.location>]> d:<[inventory]>
    - if <context.location.has_flag[bookshelf_inventory]>:
      - inventory set o:<context.location.flag[bookshelf_inventory]> d:<[inventory]>
    - inventory open d:<[inventory]>

bookshelf_inventory_save:
  type: task
  debug: false
  script:
    - define location <context.inventory.slot[5].flag[location]>
    - flag <[location]> bookshelf_inventory:<context.inventory.map_slots.exclude[5]>