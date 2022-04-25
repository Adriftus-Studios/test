actor_weapon_blood_bandit:
  type: item
  material: netherite_sword
  display name: <&c>The UGA
  lore:
  - "<&e>Sword of the Blood Bandit"
  mechanisms:
    custom_model_data: 2
  flags:
    right_click_script: actor_weapon_blood_bandit_use

actor_weapon_blood_bandit_use:
  type: task
  debug: false
  script:
    - define target <player.cursor_on[20].above.if_null[null]>
    - if <[target]> != null:
      - define points <player.location.above.right[0.5].points_between[<[target]>].distance[0.5]>
      - foreach <[points]>:
        - playeffect effect:redstone special_data:5|red at:<[value]> quantity:1 targets:<server.online_players>
        - wait 1t
      - spawn test_spawn_blood_radier2 <[target]>