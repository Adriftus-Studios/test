basic_grappling_hook:
  type: item
  material: feather
  display name: <&a>Grappling Hook
  data:
    range: 15
  lore:
    - "<&e>Tier: <&7>Basic"
    - "<&e>Range<&co> <script.data_key[data.range]>"
  flags:
    right_click_script: grappling_hook_shoot

grappling_hook_shoot:
  type: task
  debug: false
  script:
    - define range <context.item.script.data_key[data.range]>
    - define target <player.eye_location.precise_impact_normal[<[range]>].if_null[null]>
    - if <[target]> == null:
      - narrate "<&c>You have no target in range"
      - stop
    - spawn snowball[custom_model_data=20;gravity=false] <player.eye_location.below[0.45].right[0.3]> save:ent
    - if !<entry[ent].is_spawned>:
      - narrate "<&c>INTERNAL ERROR - REPORT Grappling0001"
      - stop
    - flag <entry[ent].spawned_entity> on_hit_block:grappling_hook_pull
    - wait 1t
    - adjust <entry[ent].spawned_entity> velocity:<[target].sub[<player.eye_location>]>
    - define targets <player.location.find_players_within[100]>
    - while <entry[ent].is_spawned> && <player.is_online>:
      - playeffect at:<player.eye_location.below[0.45].right[0.3].points_between[<[target]>].distance[0.33]> special_data:3|#FFFFFF effect:redstone targets:<[targets]>
      - wait 4t

grappling_hook_pull:
  type: task
  debug: false
  script:
    - define target <context.location.add[<context.hit_face>].center>
    - define targets <player.location.find_players_within[100]>
    - adjust <player> gravity:false
    - while <player.location.distance[<context.location>]> > 1.1 && <player.is_online>:
      - playeffect at:<player.eye_location.below[0.45].right[0.3].points_between[<[target]>].distance[0.33]> special_data:3|#FFFFFF effect:redstone targets:<[targets]>
      - adjust <player> velocity:<[target].sub[<player.location>].normalize>
      - wait 4t