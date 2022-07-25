test_plush_script:
  type: task
  script:
  - define m <map>
  - foreach default|creeper|drowned|husk|piglin|piglin_brute|zombie_pigman|skeleton|stray as:mob:
    - define m <[m].with[<[mob]>].as[<script[plush_<[mob]>]>]>
  - flag server plushies.ids:<[m]>

plushy_display_item:
  type: item
  material: bone_meal
  display name: <&color[#e52f88]>Plushy Display
  mechanisms:
    custom_model_data: 10000

plushy_display_gui:
  type: inventory
  debug: false
  inventory: chest
  title: <&f><&font[adriftus:cosmetics_guis]><&chr[F808]><&chr[2000]>
  gui: true
  size: 54

plush_display_events:
  type: world
  events:
    on player right clicks block with:plushy_display_item:
    - determine passively cancelled
    - if <context.relative.material.name> == air:
      - spawn armor_stand[is_small=true] <context.relative.center.relative[0,-0.5,0]> save:stand
      - equip <entry[stand].spawned_entity> head:<item[bone_meal].with[custom_model_data=10000]>
      - if !<server.flag[plushies.current_locations].exists>:
        - flag server plushies.current_locations:<map>
      - flag server plushies.current_locations:<server.flag[plushies.current_locations].with[<context.relative.center.relative[0,-0.5,0]>].as[default]>

    on player right clicks armor_stand:
    - if <server.flag[plushies.current_locations].contains[<context.entity.location>]>:
      - run cosmetic_selection_inventory_open2 def:plushies|1|<context.entity>
      - determine passively cancelled

plushies_equip:
  type: task
  script:
  - define new_id <script[plush_<context.item.flag[cosmetic]>].data_key[plush_data.model_id]>
  - define new_name <script[plush_<context.item.flag[cosmetic]>].data_key[plush_data.id]>
  - flag server plushies.current_locations:<server.flag[plushies.current_locations].with[<player.flag[current_plushy_display_entity].location>].as[<[new_name]>]>
  - equip <player.flag[current_plushy_display_entity]> head:<item[bone_meal].with[custom_model_data=<[new_id]>]>
  # Build the "unequip cosmetic" item, and store pagination data on it
  - define page <context.inventory.slot[50].flag[page]>
  - if <[new_name]> == default:
    - define item "<item[<server.flag[plushies.ids.<[new_name]>].parsed_key[display_data.material]>].with[display=<&e>No Plushy Equipped;flag=run_script:cancel;flag=page:<[page]>;flag=type:plushies]>"
  - else:
    - define material <server.flag[plushies.ids.<[new_name]>].parsed_key[display_data.material]>
    - define display "<&e>Unequip Cosmetic"
    - define lore "<&b>Left Click to Unequip|<&e>Current<&co> <&a><server.flag[plushies.ids.<[new_name]>].parsed_key[display_data.display_name]>"
    - define remove_script plushies_remove
    - define item <item[<[material]>].with[display=<[display]>;lore=<[lore]>;flag=run_script:<[remove_script]>;flag=page:<[page]>;flag=type:plushies]>
  - inventory set slot:50 o:<[item]> d:<context.inventory>
  - inventory update d:<context.inventory>

plush_default:
  type: data
  display_data:
    category: chibi.default
    display_name: <&color[#e52f88]>Default Plush
    lore: "lorem ipsum"
    description: "The default plush"
    material: bone_meal[custom_model_data=10000]
  plush_data:
    id: default
    model_id: 10000

plush_creeper:
  type: data
  display_data:
    category: chibi.creeper
    display_name: <&color[#e52f88]>Creeper Plush
    lore: "lorem ipsum"
    description: "A plush creeper"
    material: bone_meal[custom_model_data=10001]
  plush_data:
    id: creeper
    model_id: 10001

plush_drowned:
  type: data
  display_data:
    category: chibi.drowned
    display_name: <&color[#e52f88]>Drowned Plush
    lore: "lorem ipsum"
    description: "A plush drowned"
    material: bone_meal[custom_model_data=10002]
  plush_data:
    id: drowned
    model_id: 10002

plush_husk:
  type: data
  display_data:
    category: chibi.husk
    display_name: <&color[#e52f88]>Husk Plush
    lore: "lorem ipsum"
    description: "A plush husk"
    material: bone_meal[custom_model_data=10003]
  plush_data:
    id: husk
    model_id: 10003

plush_piglin:
  type: data
  display_data:
    category: chibi.piglin
    display_name: <&color[#e52f88]>Piglin Plush
    lore: "lorem ipsum"
    description: "A plush piglin"
    material: bone_meal[custom_model_data=10004]
  plush_data:
    id: piglin
    model_id: 10004

plush_piglin_brute:
  type: data
  display_data:
    category: chibi.piglin_brute
    display_name: <&color[#e52f88]>Piglin Brute Plush
    lore: "lorem ipsum"
    description: "A plush piglin brute"
    material: bone_meal[custom_model_data=10005]
  plush_data:
    id: piglin_brute
    model_id: 10005

plush_zombie_pigman:
  type: data
  display_data:
    category: chibi.zombie_pigman
    display_name: <&color[#e52f88]>Zombie Pigman Plush
    lore: "lorem ipsum"
    description: "A plush zombie pigman"
    material: bone_meal[custom_model_data=10006]
  plush_data:
    id: zombie_pigman
    model_id: 10006

plush_skeleton:
  type: data
  display_data:
    category: chibi.skeleton
    display_name: <&color[#e52f88]>Skeleton Plush
    lore: "lorem ipsum"
    description: "A plush skeleton"
    material: bone_meal[custom_model_data=10008]
  plush_data:
    id: skeleton
    model_id: 10008

plush_stray:
  type: data
  display_data:
    category: chibi.stray
    display_name: <&color[#e52f88]>Stray Plush
    lore: "lorem ipsum"
    description: "A plush stray"
    material: bone_meal[custom_model_data=10009]
  plush_data:
    id: stray
    model_id: 10009
