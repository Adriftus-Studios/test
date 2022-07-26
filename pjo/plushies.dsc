test_plush_script:
  type: task
  script:
  - define m <map>
  - define m2 <map>
  - foreach default|creeper|drowned|husk|piglin|piglin_brute|zombie_pigman|skeleton|stray as:mob:
    - define m <[m].with[<[mob]>].as[<script[plush_<[mob]>]>]>
    - define m2 <[m2].with[<[mob]>].as[true]>
  - flag server plushies.ids:<[m]>
  - run global_player_data_modify def:<server.match_player[pjochillin].uuid>|plushies.unlocked|<[m2]>

plushy_display_item:
  type: item
  material: bone_meal
  display name: <&color[#e52f88]>Plushy Display
  mechanisms:
    custom_model_data: 10000
  flags:
    right_click_script: plushy_display_place

plushy_display_place:
  type: task
  script:
  - determine passively cancelled
  - if <context.relative.material.name> == air && !<server.flag[plushies.current_locations].contains[<context.relative.center.relative[0,-0.5,0]>]>:
    - take iteminhand quantity:1
    - spawn armor_stand[is_small=true;visible=false] <context.relative.center.relative[0,-0.5,0]> save:stand
    - equip <entry[stand].spawned_entity> head:<item[bone_meal].with[custom_model_data=10000]>
    - look <entry[stand].spawned_entity> <player.location>
    - flag <entry[stand].spawned_entity> right_click_script:plushy_display_open_gui
    - flag <entry[stand].spawned_entity> on_death:plushy_display_flag_remove
    - if !<server.flag[plushies.current_locations].exists>:
      - flag server plushies.current_locations:<map>
    - flag server plushies.current_locations:<server.flag[plushies.current_locations].with[<entry[stand].spawned_entity.location>].as[default]>
    - flag server plushies.supporting_blocks:<server.flag[plushies.supporting_blocks].with[<entry[stand].spawned_entity.location.below[1].block>].as[<entry[stand].spawned_entity>]>
    - flag <entry[stand].spawned_entity.location.below[1].block> on_break:plushy_display_flag_remove

plushy_display_flag_remove:
  type: task
  script:
  - if <context.location.exists>:
    - flag <server.flag[plushies.supporting_blocks].get[<context.location>]> on_death:!
    - flag server plushies.current_locations:<server.flag[plushies.current_locations].exclude[<server.flag[plushies.supporting_blocks].get[<context.location>].location>]>
    - remove <server.flag[plushies.supporting_blocks].get[<context.location>]>
    - flag server plushies.supporting_blocks:<server.flag[plushies.supporting_blocks].exclude[<context.location>]>
    - flag <context.location> on_break:!
    - drop plushy_display_item <context.location.above[1]> quantity:1
  - else:
    - flag server plushies.current_locations:<server.flag[plushies.current_locations].exclude[<context.entity.location>]>
    - flag server plushies.supporting_blocks:<server.flag[plushies.supporting_blocks].exclude[<context.entity.location.below[1].block>]>
    - flag <context.entity.location.below[1].block> on_break:!
    - drop plushy_display_item <context.entity.location> quantity:1
    - determine NO_DROPS

plushy_display_open_gui:
  type: task
  script:
  # TODO: change to original script in network-script-data repo
  - if <player.is_sneaking>:
    - run cosmetic_selection_inventory_open2 def:plushies|1|<context.entity>
    - determine passively cancelled

plushy_display_gui:
  type: inventory
  debug: false
  inventory: chest
  title: <&f><&font[adriftus:cosmetics_guis]><&chr[F808]><&chr[2000]>
  gui: true
  size: 54

plushies_unlock:
  type: task
  definitions: id
  script:
  - if <server.has_flag[plushies.ids.<[id]>]> && !<yaml[global.player.<player.uuid>].contains[plushies.unlocked.<[id]>]||false>:
    - run global_player_data_modify def:<player.uuid>|plushies.unlocked.<[id]>|true

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

plushies_remove:
  type: task
  script:
  - flag server plushies.current_locations:<server.flag[plushies.current_locations].with[<player.flag[current_plushy_display_entity].location>].as[default]>
  - equip <player.flag[current_plushy_display_entity]> head:<item[bone_meal].with[custom_model_data=10000]>
  - define item "<item[<server.flag[plushies.ids.default].parsed_key[display_data.material]>].with[display=<&e>No Plushy Equipped;flag=run_script:cancel;flag=page:<[page]>;flag=type:plushies]>"
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
