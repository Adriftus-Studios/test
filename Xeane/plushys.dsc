custom_object_plushy_display:
  type: data
  item: plushy_display_item
  entity: plushy_entity
  interaction: plushys_use
  place_checks_task: plushies_checks
  after_place_task: plushies_placed
  remove_task: plushies_remove_stand
  barrier_locations:
    - <[location]>

load_plush_data:
  type: world
  debug: false
  events:
    on scripts loaded:
      - flag server plushies.ids:!
      - foreach <util.scripts.filter[name.starts_with[plush_]].filter[container_type.equals[data]]> as:plush_script:
        - flag server plushies.ids.<[plush_script].data_key[plush_data.id]>:<[plush_script]>

plushys_use:
  type: task
  debug: false
  script:
    - if <player.is_sneaking> && <context.location.flag[custom_object].flag[owner]> == <player.uuid>:
      - run custom_object_remove def:<context.location.flag[custom_object]>
    - else:
      - flag player plushy_display:<context.location.flag[custom_object]>
      - run plushy_display_open_gui

#TODO REMOVE THE WAIT AND COMMENTS
plushies_checks:
  type: task
  debug: false
  script:
    - wait 1t
#    - if <plugin[towny].exists> && ( !<context.location.has_town> || <context.location.towny.resident> != <player> ):
#      - narrate "<&c>Unable to place Plushies in areas you do not own"
#      - stop

plushies_placed:
  type: task
  debug: false
  definitions: entity
  script:
    - flag <[entity]> plushy_id:default
    - flag <[entity]> owner:<player.uuid>

plushy_display_open_gui:
  type: task
  script:
    - run cosmetic_selection_inventory_open def:plushies

plushies_equip:
  type: task
  definitions: id
  script:
    - if <player.has_flag[plushy_display]>:
      - define id <context.item.flag[cosmetic]>
      - define script <server.flag[plushies.ids.<[id]>]>
      - adjust <player.flag[plushy_display]> equipment:air|air|air|<[script].data_key[display_data.material]>

plushies_remove:
  type: task
  definitions: id
  script:
    - if <player.has_flag[plushy_display]>:
      - adjust <player.flag[plushy_display]> equipment:air|air|air|<script[plush_default].data_key[display_data.material]>

plushies_unlock:
  type: task
  definitions: id
  script:
  - if <server.has_flag[plushies.ids.<[id]>]> && !<yaml[global.player.<player.uuid>].contains[plushies.unlocked.<[id]>]||false>:
    - run global_player_data_modify def:<player.uuid>|plushies.unlocked.<[id]>|true

plushy_entity:
  type: entity
  debug: false
  entity_type: armor_stand
  mechanisms:
    custom_name_visible: true
    visible: false
    gravity: false
    is_small: true
    equipment:
      helmet: <script[plush_default].data_key[display_data.material]>
  flags:
    on_entity_added: custom_object_update

plushy_display_item:
  type: item
  material: bone_meal
  display name: <&color[#e52f88]>Plushy Display
  mechanisms:
    custom_model_data: 10000
  flags:
    right_click_script: custom_object_place
    custom_object: plushy_display

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
    lore: "I do what when I grow up?"
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
    lore: "<&i>gurgle gurgle."
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
    lore: "Still warm to the touch"
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
    lore: "Adriftus Trading Co not responsible for stolen gold"
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
    lore: "This little piggy killed the wolf!"
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
    lore: "How did this even happen"
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
    lore: "Xylophone Mallet not included."
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
    lore: "Must be cold with no skin."
    description: "A plush stray"
    material: bone_meal[custom_model_data=10009]
  plush_data:
    id: stray
    model_id: 10009

plush_wither_skeleton:
  type: data
  display_data:
    category: chibi.wither_skeleton
    display_name: <&color[#e52f88]>Wither Skeleton Plush
    lore: "Tried a little too hard to get warm."
    description: "A plush wither skeleton"
    material: bone_meal[custom_model_data=10010]
  plush_data:
    id: stray
    model_id: 10010


plush_warden:
  type: data
  display_data:
    category: chibi.warden
    display_name: <&color[#e52f88]>Warden Plush
    lore: "Hopefully he's not blocking your path!"
    description: "A plush warden"
    material: bone_meal[custom_model_data=10010]
  plush_data:
    id: warden
    model_id: 10010

plush_zombie:
  type: data
  display_data:
    category: chibi.zombie
    display_name: <&color[#e52f88]>Zombie Plush
    lore: "Bwains?"
    description: "A plush zombie"
    material: bone_meal[custom_model_data=10011]
  plush_data:
    id: stray
    model_id: 10011
