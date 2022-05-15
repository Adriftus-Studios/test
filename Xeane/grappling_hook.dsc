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

better_grappling_hook:
  type: item
  material: feather
  display name: <&a>Grappling Hook
  data:
    range: 20
  lore:
    - "<&e>Tier: <&7>Basic"
    - "<&e>Range<&co> <script.data_key[data.range]>"
  flags:
    right_click_script: grappling_hook_shoot

advanced_grappling_hook:
  type: item
  material: feather
  display name: <&a>Grappling Hook
  data:
    range: 25
  lore:
    - "<&e>Tier: <&7>Basic"
    - "<&e>Range<&co> <script.data_key[data.range]>"
  flags:
    right_click_script: grappling_hook_shoot

master_grappling_hook:
  type: item
  material: feather
  display name: <&a>Grappling Hook
  data:
    range: 30
  lore:
    - "<&e>Tier: <&7>Basic"
    - "<&e>Range<&co> <script.data_key[data.range]>"
  flags:
    right_click_script: grappling_hook_shoot

godly_grappling_hook:
  type: item
  material: feather
  display name: <&a>Grappling Hook
  data:
    range: 40
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
    - define target <player.eye_location.precise_cursor_on[<[range]>].if_null[null]>
    - define start <player.eye_location.forward[0.5]>
    - if <[target]> == null:
      - narrate "<&c>You have no target in range"
      - stop
    - spawn snowball[item=feather[custom_model_data=20];gravity=false] <[start]> save:ent
    - if !<entry[ent].spawned_entity.is_spawned>:
      - narrate "<&c>INTERNAL ERROR - REPORT Grappling0001"
      - stop
    - adjust <entry[ent].spawned_entity> velocity:<[target].sub[<[start]>].normalize>
    - flag <entry[ent].spawned_entity> on_hit_block:grappling_hook_pull
    - flag <entry[ent].spawned_entity> user:<player>
    - flag <entry[ent].spawned_entity> target:<[target]>
    - wait 1t
    - define targets <player.location.find_players_within[100]>
    - while <entry[ent].spawned_entity.is_spawned> && <player.is_online>:
      - if <[loop_index].mod[5]> == 0:
        - adjust <entry[ent].spawned_entity> velocity:<[target].sub[<[start]>].normalize>
      - playeffect at:<player.eye_location.below[0.45].right[0.3].points_between[<entry[ent].spawned_entity.location>].distance[0.33]> quantity:5  offset:0 special_data:2|#FFFFFF effect:redstone targets:<[targets]>
      - wait 4t

grappling_hook_pull:
  type: task
  debug: false
  script:
    - adjust <queue> linked_player:<context.projectile.flag[user]>
    - define target <context.projectile.flag[target]>
    - define targets <context.location.find_players_within[100]>
    - adjust <player> gravity:false
    - while <player.location.distance[<[target]>]> > 1.7 && <player.is_online>:
      - playeffect at:<player.eye_location.below[0.45].right[0.3].points_between[<[target]>].distance[0.33]> quantity:5 offset:0 special_data:2|#FFFFFF effect:redstone targets:<[targets]>
      - adjust <player> velocity:<[target].sub[<player.location>].normalize>
      - wait 4t
      - if <[loop_index]> > 45:
        - while stop
    - adjust <player> gravity:true