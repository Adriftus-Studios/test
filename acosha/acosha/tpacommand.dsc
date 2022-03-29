
tpa_command:
    type: command
    name: tpa
    description: Used To Request A Teleport
    usage: /tpa (name)
    script:
    - if <context.args.size> < 1:
      - narrate "<red><bold>Please Use A Name That's Online"
      - stop
    - define target <server.match_player[<context.args.get[1]>].if_null[null]>
    - if <[target]> = null:
      - narrate "<red><bold>This Is Not A Player"
      - stop
    - if <[target]> = <player.name>:
      - narrate "You Can Not Tpaccept Yourself"
      - stop
    - else:
      - inject tpa_execute

tpa_item:
  type: item
  material: feather
  display name: <&a>TPA ITEM!
  flags:
    right_click_script: 
      - tpa_remove_item
      - target_players_open
    callback: tpa_execute

tpa_execute:
  type: task
  debug: false
  definitions: target
  script:
    - define prompt "<proc[get_player_display_name]><&r><&e> wants to teleport to you"
    - narrate "<&a>TPA Request sent!"
    - flag <[target]> tmp.tpa_accept:<player> expire:30s
    - run chat_confirm def:<[prompt]>|tpa_command_callback player:<[target]>

tpa_remove_item:
  type: task
  debug: false
  script:
    - take iteminhand
    - repeat 5:
      - playeffect at:<player.eye_location.forward> quantity:5 offset:0.1 effect:ITEM_CRACK special_data:end_crystal
      - wait 1t

tpa_command_callback:
    type: task
    debug: true
    definitions: bool
    script:
    - if !<player.has_flag[tmp.tpa_accept]>:
      - narrate "<&c>TPA Request has expired."
      - stop
    - if !<player.flag[tmp.tpa_accept].is_online>:
      - narrate "<&c>Player is offline."
      - stop
    - if !<[bool]>:
      - narrate "<&c>TPA was Denied" targets:<player.flag[tmp.tpa_accept]>|<player>
      - stop
    - narrate "<&a>TPA Accepted!" targets:<player.flag[tmp.tpa_accept]>|<player>
    - define location <player.location>
    - run teleportation_animation_run def:<[location]> player:<player.flag[tmp.tpa_accept]>



