thanksgiving_cornucopia:
  type: item
  debug: false
  material: cooked_chicken
  mechanisms:
    custom_model_data: 11
  display name: <&6>Thanksgiving Feast
  lore:
  - <&e>Serves 10 people!

cornucopia_placer:
  type: world
  debug: false
  events:
    on player right clicks block with:thanksgiving_cornucopia|leftover_thanksgiving_cornucopia bukkit_priority:highest:
      - determine passively cancelled
      - ratelimit <player> 5s
      - take iteminhand quantity:1
      - if <context.location.above[1].material.name> == air:
        - define location <context.location.block.center.above[0.55]>
      - if <context.location.material.name.advanced_matches_text[*_trapdoor]>:
        - define location <context.location.block.center.below[0.3]>
      - if <context.location.material.name.advanced_matches_text[*_carpet]>:
        - define location <context.location.block.center.below[0.4]>
      - if <context.location.material.name.advanced_matches_text[*_slab]>:
        - if <context.location.material.type> == bottom:
          - define location <context.location.block.center.above[0.02]>
        - if <context.location.material.type> == top:
          - define location <context.location.block.center.above[0.53]>
      - spawn armor_stand[equipment=air|air|air|cooked_chicken[custom_model_data=11];visible=false] <[location]> save:cornucopia_stand
      - flag <entry[cornucopia_stand].spawned_entity> cornucopia:10
      - flag <entry[cornucopia_stand].spawned_entity> owner:<player>


cornucopia_slicer:
  type: world
  debug: false
  events:
    on player right clicks entity_flagged:cornucopia:
      - determine passively cancelled
      - if <player.is_sneaking>:
        - if <context.entity.flag[owner]> != <player>:
          - narrate "<&c>You do not own this cornucopia to destroy it"
        - if <context.entity.has_flag[temp.destroy]>:
          - remove <context.entity>
          - narrate "<&a>Cornucopia destroyed"
        - if !<context.entity.has_flag[temp.destroy]>:
          - flag <context.entity> temp.destroy expire:10s
          - narrate "<&e>Click again <&6> in the next <&e>10 seconds<&6> to destroy the Cornucopia."
        - stop
      - if <player.food_level> == 20:
        - narrate "<&c>You're stuffed, time for a nap!"
        - stop
      - ratelimit <player> 5t
      - flag <context.entity> cornucopia:--
      - feed <player> amount:10 saturation:10
      - playsound sound:ENTITY_GENERIC_EAT <player.location>
      - if <context.entity.flag[cornucopia]> < 1:
        - remove <context.entity>
        - stop
      - equip <context.entity> head:cooked_chicken[custom_model_data=<context.entity.equipment.get[4].custom_model_data.sub[1]>]
      - wait 5t
      - playsound sound:entity_player_burp <player.location>




