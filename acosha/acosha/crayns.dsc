crayon_brown:
    type: item
    material: leather_horse_armor
    display name: Brown Crayon
    flags:
      right_click_script: crayon_drawing
      custom_durability:
        max: 32
        current: 0
    mechanisms:
        custom_model_data: 18
        color: brown
    recipes:
        1:
            type: shapeless
            input: brown_candle

crayon_white:
    type: item
    material: leather_horse_armor
    display name: Yellow Crayon
    flags:
      right_click_script: crayon_drawing
      custom_durability:
        max: 32
        current: 0
    mechanisms:
        custom_model_data: 18
        color: white
    recipes:
        1:
            type: shapeless
            input: white_candle

crayon_yellow:
    type: item
    material: leather_horse_armor
    display name: Yellow Crayon
    flags:
      right_click_script: crayon_drawing
      custom_durability:
        max: 32
        current: 0
    mechanisms:
        custom_model_data: 18
        color: yellow
    recipes:
        1:
            type: shapeless
            input: yellow_candle

crayon_orange:
    type: item
    material: leather_horse_armor
    display name: Orange Crayon
    flags:
      right_click_script: crayon_drawing
      custom_durability:
        max: 32
        current: 0
    mechanisms:
        custom_model_data: 18
        color: orange
    recipes:
        1:
            type: shapeless
            input: Orange_candle

crayon_Fuchsia:
    type: item
    material: leather_horse_armor
    display name: Magenta Crayon
    flags:
      right_click_script: crayon_drawing
      custom_durability:
        max: 32
        current: 0
    mechanisms:
        custom_model_data: 18
        color: Fuchsia
    recipes:
        1:
            type: shapeless
            input: Magenta_candle

crayon_light_blue:
    type: item
    material: leather_horse_armor
    display name: Light Blue Crayon
    flags:
      right_click_script: crayon_drawing
      custom_durability:
        max: 32
        current: 0
    mechanisms:
        custom_model_data: 18
        color: aqua
    recipes:
        1:
            type: shapeless
            input: light_blue_candle

crayon_lime:
    type: item
    material: leather_horse_armor
    display name: Lime Crayon
    flags:
      right_click_script: crayon_drawing
      custom_durability:
        max: 32
        current: 0
    mechanisms:
        custom_model_data: 18
        color: Lime
    recipes:
        1:
            type: shapeless
            input: lime_candle

crayon_pink:
    type: item
    material: leather_horse_armor
    display name: Pink Crayon
    flags:
      right_click_script: crayon_drawing
      custom_durability:
        max: 32
        current: 0
    mechanisms:
        custom_model_data: 18
        color: Lime
    recipes:
        1:
            type: shapeless
            input: Pink_candle

crayon_Gray:
    type: item
    material: leather_horse_armor
    display name: Gray Crayon
    flags:
      right_click_script: crayon_drawing
      custom_durability:
        max: 32
        current: 0
    mechanisms:
        custom_model_data: 18
        color: Gray
    recipes:
        1:
            type: shapeless
            input: Gray_candle

crayon_purple:
    type: item
    material: leather_horse_armor
    display name: Purple Crayon
    flags:
      right_click_script: crayon_drawing
      custom_durability:
        max: 32
        current: 0
    mechanisms:
        custom_model_data: 18
        color: Purple
    recipes:
        1:
            type: shapeless
            input: Purple_candle

crayon_Blue:
    type: item
    material: leather_horse_armor
    display name: Blue Crayon
    flags:
      right_click_script: crayon_drawing
      custom_durability:
        max: 32
        current: 0
    mechanisms:
        custom_model_data: 18
        color: blue
    recipes:
        1:
            type: shapeless
            input: blue_candle

crayon_green:
    type: item
    material: leather_horse_armor
    display name: Green Crayon
    flags:
      right_click_script: crayon_drawing
      custom_durability:
        max: 32
        current: 0
    mechanisms:
        custom_model_data: 18
        color: green
    recipes:
        1:
            type: shapeless
            input: green_candle

crayon_red:
    type: item
    material: leather_horse_armor
    display name: Red Crayon
    flags:
      right_click_script: crayon_drawing
      custom_durability:
        max: 32
        current: 0
    mechanisms:
        custom_model_data: 18
        color: Red
    recipes:
        1:
            type: shapeless
            input: Red_candle

crayon_black:
    type: item
    material: leather_horse_armor
    display name: Black Crayon
    flags:
      right_click_script: crayon_drawing
      custom_durability:
        max: 32
        current: 0
    mechanisms:
        custom_model_data: 18
        color: black
    recipes:
        1:
            type: shapeless
            input: black_candle

crayon_frame:
  type: entity
  debug: false
  entity_type: item_frame
  mechanisms:
    visible: false

crayon_drawing:
    type: task
    debug: true
    script:
      - ratelimit <player> 2t
      - stop if:<context.location.material.is_solid.not>
      - stop if:<context.location.material.name.equals[barrier]>
      - define differential <context.relative.sub[<context.location>]>
      - define occupied <context.location.center.add[<[differential].mul[0.5]>].find_entities[crayon_frame].within[0.2]>
      - if <[occupied].size> > 0:
        - stop
      - spawn crayon_frame[rotation=<[differential].vector_to_face>] <context.relative> save:crayon
      - adjust <entry[crayon].spawned_entity> visible:false
      - define color <player.item_in_hand.color>
      - adjust <entry[crayon].spawned_entity> framed:<item[leather_horse_armor].with[custom_model_data=21;color=<[color]>]>
      - flag <entry[crayon].spawned_entity> on_damaged:crayon_breaking
      - inject custom_durability_process_task
      - narrate <player.item_in_hand.flag[custom_durability.current]>
      - if <player.item_in_hand.script.name.starts_with[crayon].if_null[false]> && <player.item_in_hand.flag[custom_durability.current].mod[4]> == 0:
        - inventory adjust slot:<player.held_item_slot> custom_model_data:<player.item_in_hand.custom_model_data.sub[1]>

crayon_breaking:
    type: task
    script:
        - determine passively cancelled
        - adjust <context.entity> framed:<item[air]>
        - remove <context.entity>


