Custom_Cake_placer:
  type: world
  debug: false
  events:
    on player right clicks block with:custom_food_chocolate_cake|custom_food_carrot_cake bukkit_priority:highest:
      - determine passively cancelled
      - ratelimit <player> 5s
      - define type <player.item_in_hand.script.name.after[custom_food_]>
      - if <[type]> == chocolate_cake:
        - define CMD 16
        - define servings 7
        - define amount 2
        - define saturation 0.4
      - if <[type]> == carrot_cake:
        - define CMD 9
        - define servings 7
        - define amount 2
        - define saturation 0.4
      - take iteminhand quantity:1
      - if <context.location.above[1].material.name> == air:
        - define location <context.location.block.center.above[0.6]>
      - if <context.location.material.name.advanced_matches_text[*_trapdoor]>:
        - define location <context.location.block.center.below[0.2]>
      - if <context.location.material.name.advanced_matches_text[*_carpet]>:
        - define location <context.location.block.center.below[0.35]>
      - if <context.location.material.name.advanced_matches_text[*_slab]>:
        - if <context.location.material.type> == bottom:
          - define location <context.location.block.center.above[0.07]>
        - if <context.location.material.type> == top:
          - define location <context.location.block.center.above[0.58]>
      - if <[location].exists>:
        - spawn armor_stand[equipment=air|air|air|cake[custom_model_data=<[CMD]>];visible=false;gravity=false] <[location]> save:cake_entity
        - flag <entry[cake_entity].spawned_entity> cake_type:<[type]>
        - flag <entry[cake_entity].spawned_entity> servings:<[servings]>
        - flag <entry[cake_entity].spawned_entity> amount:<[amount]>
        - flag <entry[cake_entity].spawned_entity> saturation:<[saturation]>

cake_slicer:
  type: world
  debug: false
  events:
    on player right clicks entity_flagged:cake_type:
      - determine passively cancelled
      - if <player.food_level> == 20:
        - stop
      - ratelimit <player> 5t
      - flag <context.entity> servings:--
      - feed <player> amount:<context.entity.flag[amount]> saturation:<context.entity.flag[saturation]>
      - playsound sound:ENTITY_GENERIC_EAT <player.location>
      - if <context.entity.flag[servings]> < 1:
        - remove <context.entity>
        - stop
      - equip <context.entity> head:cake[custom_model_data=<context.entity.equipment.get[4].custom_model_data.sub[1]>]
