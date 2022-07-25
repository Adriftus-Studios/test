test_plush_script:
  type: task
  script:
  - define m <map>
  - foreach creeper|drowned|husk|piglin|piglin_brute|zombie_pigman|skeleton|stray as:mob:
    - define m <[m].with[<[mob]>].as[<script[plush_<[mob]>]>]>
  - flag server plushies.ids:<[m]>

plush_display_item:
  type: item
  material: bone_meal
  display name: <&color[#e52f88]>Plush Display
  mechanisms:
    custom_model_data: 10000

plush_display_events:
  type: world
  events:
    on player right clicks block with:plush_display_item:
    - determine passively cancelled
    - if <context.relative.material.name> == air:
      - spawn armor_stand[is_small=true] <context.relative.center.relative[0,-0.5,0]> save:stand
      - narrate <context.relative.center.relative[0,-0.5,0]> targets:<player>
      - equip <entry[stand].spawned_entity> head:<item[bone_meal].with[custom_model_data=10000]>
      - flag <context.relative.center.relative[0,-0.5,0]> plush_current:10000

      # on player right clicks armor_stand:
      # - determine passively cancelled


plush_creeper:
  type: data
  display_data:
    category: chibi.creeper
    display_name: <&color[#e52f88]>Creeper Plush
    lore: "lorem ipsum"
    description: "A plush creeper"
    material: bone_meal[custom_model_data=10001]
  plush_data:
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
    model_id: 10009

plushies_equip:
    type: task
    # debug: false
    definitions: plush_id
    script:
    - determine passively cancelled
    - define plush_id <context.item.flag[cosmetic].if_null[default]> if:<[plush_id].exists.not>
    - if !<script[mask_<[plush_id]>].exists>:
        - debug error "UNKNOWN PLUSH<&co> <[plush_id]>"
        - stop
    - inventory close
    - wait 1t
    - define script <script[plush_<[plush_id]>]>
    # potential permissions for plushies?
    # - if <[script].data_key[mask_data.permission].exists> && !<player.has_permission[<[script].data_key[mask_data.permission]>]>:
    #     - narrate "<&c>You lack the permission for this mask."
    #     - stop
    - run global_player_data_modify def:<player.uuid>|plushies.current|<[script]>
    # TODO: add more to this code
