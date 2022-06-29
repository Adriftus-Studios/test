crayon_survival:
    type: item
    material: leather_horse_armor
    display name: <&f>Survival Crayon
    Lore:
      - <&6>Not for human consumption.
    flags:
      right_click_script: crayon_drawing
      custom_durability:
        max: 32
        current: 0
    mechanisms:
        custom_model_data: 18
    recipes:
        1:
            type: shapeless
            input: black_candle/red_candle/green_candle/blue_candle/purple_candle/gray_candle/pink_candle/lime_candle/light_blue_candle/magenta_candle/orange_candle/brown_candle/white_candle/yellow_candle

Survival_crayon_craft_event:
  Type: world
  Debug: true
  Events:
    On crayon_survival recipe formed:
      - if <context.recipe.size> > 1:
        - stop
      - determine passively <context.item.with[color=<context.recipe.get[1].material.name.before[_candle]>]>


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


