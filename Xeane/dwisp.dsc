dwisp_populate:
  type: world
  debug: false
  populate:
    - flag server givable_items:!
    - flag server givable_items:|:<server.scripts.filter[data.show_in_give].parse[name.to_uppercase]>
  events:
    on server start:

dwisp_command:
  type: command
  name: dwisp
  usage: /dwisp (command) (args)
  description: dWisp
  permission: adriftus.admin
  script:
    - if <context.args.size> < 1:
      - narrate "<&c>You must specify arguments"
      - stop
    - choose <context.args.get[1]>:
      - case spawn

dwisp_armor_stand:
  type: entity
  debug: false
  entity_type: armor_stand
  mechanisms:
    custom_name_visible: true
    visible: false
    is_small: true
    invincible: true
    gravity: false

dwisp_dropped_item:
  type: entity
  debug: false
  entity_type: dropped_item
  mechanisms:
    custom_name_visible: true
    pickup_delay: 4s
    velocity: 0,-.05,0

dwisp_heal_target:
  type: task
  debug: false
  definitions: target
  script:
    - define distance <player.flag[dwisp.active.location].distance[<[target].location>].mul[0.1]>
    - define points <player.flag[dwisp.active.location].points_between[<[target].eye_location.below>].distance[<[distance]>]>
    - define targets <player.flag[dwisp.active.location].find_players_within[100]>
    - define start <player.flag[dwisp.active.location]>
    - repeat 10:
      - define point <[start].add[<[target.eye_location].sub[<player.flag[dwisp.active.location]>].mul[<[value].mul[0.1]>]>]>
      - playeffect effect:redstone at:<[point]> offset:0.05 quantity:5 special_data:1|<player.flag[dwisp.data.color1]> targets:<[targets]>
      - playeffect effect:redstone at:<[point]> offset:0.1 quantity:5 special_data:0.5|<player.flag[dwisp.data.color2]> targets:<[targets]>
      - wait 1t
    - heal <[target]>
    - feed <[target]>
    - repeat 5:
      - playeffect effect:redstone at:<[target].location.above> offset:0.25,0.75,0.25 quantity:10 special_data:2|<player.flag[dwisp.data.color1]> targets:<[targets]>
      - playeffect effect:redstone at:<[target].location.above> offset:0.25,0.75,0.25 quantity:10 special_data:1|<player.flag[dwisp.data.color2]> targets:<[targets]>
      - wait 1t
    - ratelimit <[target]> 5s
    - narrate "<&a>You Feel Invigorated" targets:<[target]>

dwisp_run:
  type: task
  debug: false
  script:
    - if !<player.has_flag[dwisp.data.color1]> || !<player.has_flag[dwisp.data.color2]>:
      - narrate "<&c>You must configure your dWisp colors first"
    - if !<player.has_flag[dwisp.data.name]>:
      - narrate "<&c>You must configure your dWisp name first"
      - stop
    - while <player.has_flag[dwisp.active]> && <player.is_online>:
      - choose <player.flag[dwisp.active.task]>:
        # Basic Idle Animation
        - case idle:
          - while <player.flag[dwisp.active.task]> == idle && <player.is_online>:
            - define points <proc[define_curve1].context[<player.flag[dwisp.active.location]>|<player.location.above[2].random_offset[1,0.5,1]>|2|<util.random.int[-20].to[20]>|<player.flag[dwisp.active.location].distance[<player.eye_location>].mul[0.1]>]>
            - define targets <player.location.find_players_within[100]>
            - foreach <[points]> as:point:
              - playeffect effect:redstone at:<[point]> offset:0.05 quantity:5 special_data:1.5|<player.flag[dwisp.data.color1]> targets:<[targets]>
              - playeffect effect:redstone at:<[point]> offset:0.1 quantity:5 special_data:0.75|<player.flag[dwisp.data.color2]> targets:<[targets]>
              - teleport <player.flag[dwisp.active.entity]> <[point].below[0.5]>
              - flag <player> dwisp.active.location:<[point]>
              - wait 2t

        # Far Idle (5 opposed to 2 blocks)
        - case far_idle:
          - while <player.flag[dwisp.active.task]> == far_idle && <player.is_online>:
            - define points <proc[define_curve1].context[<player.flag[dwisp.active.location]>|<player.location.above[2].random_offset[5,0.5,5]>|2|<util.random.int[-20].to[20]>|<player.flag[dwisp.active.location].distance[<player.eye_location>].mul[0.1]>]>
            - define targets <player.location.find_players_within[100]>
            - foreach <[points]> as:point:
              - playeffect effect:redstone at:<[point]> offset:0.05 quantity:5 special_data:1.5|<player.flag[dwisp.data.color1]> targets:<[targets]>
              - playeffect effect:redstone at:<[point]> offset:0.1 quantity:5 special_data:0.75|<player.flag[dwisp.data.color2]> targets:<[targets]>
              - teleport <player.flag[dwisp.active.entity]> <[point].below[0.5]>
              - flag <player> dwisp.active.location:<[point]>
              - wait 2t
        
        # Spawning Wisp
        - case spawn:
          - flag <player> dwisp.active.location:<player.eye_location>
          - define targets <player.location.find_players_within[100]>
          - spawn dwisp_armor_stand[custom_name=<player.flag[dwisp.data.name]>] <player.eye_location> save:wisp
          - flag <player> dwisp.active.entity:<entry[wisp].spawned_entity>
          - flag <entry[wisp].spawned_entity> on_entity_added:remove_this_entity
          - repeat 20:
            - playeffect effect:redstone at:<player.flag[dwisp.active.location]> offset:0.05 quantity:5 special_data:1.5|<player.flag[dwisp.data.color1]> targets:<[targets]>
            - playeffect effect:redstone at:<player.flag[dwisp.active.location]> offset:0.1 quantity:5 special_data:0.75|<player.flag[dwisp.data.color2]> targets:<[targets]>
            - teleport <player.flag[dwisp.active.entity]> <player.flag[dwisp.active.location].below[0.5]>
            - flag <player> dwisp.active.location:<player.flag[dwisp.active.location].above[0.1]>
            - wait 2t
          - if !<player.has_flag[dwisp.active.queued_action]>:
            - flag <player> dwisp.active.task:far_idle
          - else:
            - flag player dwisp.active.task:<player.flag[dwisp.active.queued_action]>
            - flag player dwisp.active.queued_action:!
        
        # Despawning Wisp
        - case sleep:
          - define targets <player.location.find_players_within[100]>
          - flag <player> dwisp.active.path:<proc[define_curve1].context[<player.flag[dwisp.active.location]>|<player.eye_location.above[2]>|2|90|0.1]>
          - foreach <player.flag[dwisp.active.path]> as:point:
            - playeffect effect:redstone at:<[point]> offset:0.05 quantity:5 special_data:1.5|<player.flag[dwisp.data.color1]> targets:<[targets]>
            - playeffect effect:redstone at:<[point]> offset:0.1 quantity:5 special_data:0.75|<player.flag[dwisp.data.color2]> targets:<[targets]>
            - teleport <player.flag[dwisp.active.entity]> <[point].below[0.5]>
            - flag <player> dwisp.active.location:<[point]>
            - wait 2t
          - repeat 20:
            - playeffect effect:redstone at:<player.flag[dwisp.active.location]> offset:0.05 quantity:5 special_data:1.5|<player.flag[dwisp.data.color1]> targets:<[targets]>
            - playeffect effect:redstone at:<player.flag[dwisp.active.location]> offset:0.1 quantity:5 special_data:0.75|<player.flag[dwisp.data.color2]> targets:<[targets]>
            - teleport <player.flag[dwisp.active.entity]> <player.flag[dwisp.active.location].below[0.5]>
            - flag <player> dwisp.active.location:<player.flag[dwisp.active.location].below[0.1]>
            - wait 2t
          - remove <player.flag[dwisp.active.entity]>
          - flag <player> dwisp.active:!
        
        # Guard Player
        - case guard_target:
          - define target <player.flag[dwisp.active.guard_target]>
          - while <player.flag[dwisp.active.task]> == guard_target && <player.is_online> && <[target].is_online>:
            - if <[target].health> != <[target].health_max>:
              - run dwisp_heal_target def:<[target]>
            - define mob <[target].location.find_entities[monster].within[30].random.if_null[none]>
            - if <[mob]> != none && <[mob].is_spawned>:
              - define points <proc[define_curve1].context[<player.flag[dwisp.active.location]>|<[mob].eye_location>|2|<util.random.int[-20].to[20]>|<player.flag[dwisp.active.location].distance[<[mob].eye_location>].mul[0.1]>]>
            - else:
              - define points <proc[define_curve1].context[<player.flag[dwisp.active.location]>|<[target].location.above[2].random_offset[1,0.5,1]>|2|<util.random.int[-20].to[20]>|<player.flag[dwisp.active.location].distance[<[target].eye_location>].mul[0.1]>]>
            - define targets <[target].location.find_players_within[100]>
            - foreach <[points]> as:point:
              - playeffect effect:redstone at:<[point]> offset:0.05 quantity:5 special_data:1.5|<player.flag[dwisp.data.color1]> targets:<[targets]>
              - playeffect effect:redstone at:<[point]> offset:0.1 quantity:5 special_data:0.75|<player.flag[dwisp.data.color2]> targets:<[targets]>
              - teleport <player.flag[dwisp.active.entity]> <[point].below[0.5]>
              - flag <player> dwisp.active.location:<[point]>
              - wait 2t
            - if <[mob]> != none && <[mob].is_spawned>:
              - repeat 10:
                - playeffect effect:redstone at:<[mob].location.above> offset:0.25,0.75,0.25 quantity:20 special_data:5|<player.flag[dwisp.data.color1]> targets:<[targets]>
                - playeffect effect:redstone at:<[mob].location.above> offset:0.25,0.75,0.25 quantity:20 special_data:2|<player.flag[dwisp.data.color2]> targets:<[targets]>
                - wait 1t
              - kill <[mob]>
              - wait 2t

        # Stay Put
        - case stay:
            - define target <player.flag[dwisp.active.stay_target].if_null[null]>
            - define target <player.cursor_on.center.above[2].if_null[<player.location.above[3]>]> if:<[target].equals[null]>
            - define points <proc[define_curve1].context[<player.flag[dwisp.active.location]>|<[target]>|2|<util.random.int[-20].to[20]>|<player.flag[dwisp.active.location].distance[<[target]>].mul[0.1]>]>
            - define targets <[target].find_players_within[100]>
            - foreach <[points]> as:point:
              - playeffect effect:redstone at:<[point]> offset:0.05 quantity:5 special_data:1.5|<player.flag[dwisp.data.color1]> targets:<[targets]>
              - playeffect effect:redstone at:<[point]> offset:0.1 quantity:5 special_data:0.75|<player.flag[dwisp.data.color2]> targets:<[targets]>
              - teleport <player.flag[dwisp.active.entity]> <[point].below[0.5]>
              - flag <player> dwisp.active.location:<[point]>
              - wait 2t
            - while <player.flag[dwisp.active.task]> == stay:
              - if <[loop_index].mod[100]> == 0:
                - define targets <[target].find_players_within[100]>
              - playeffect effect:redstone at:<player.flag[dwisp.active.location]> offset:0.05 quantity:5 special_data:1.5|<player.flag[dwisp.data.color1]> targets:<[targets]>
              - playeffect effect:redstone at:<player.flag[dwisp.active.location]> offset:0.1 quantity:5 special_data:0.75|<player.flag[dwisp.data.color2]> targets:<[targets]>
              - wait 2t

        # Give Player Item
        - case give:
            # Get Definition Flags
            - define target <player.flag[dwisp.active.give_target]>
            - define item <player.flag[dwisp.active.give_item]>

            # Spawn Item Infront of Self
            - if <[target]> == <player>:
              - define points <proc[define_curve1].context[<player.flag[dwisp.active.location]>|<player.eye_location.forward_flat[4]>|2|90|<player.flag[dwisp.active.location].distance[<player.eye_location>].mul[0.1]>]>
              - foreach <[points]> as:point:
                - playeffect effect:redstone at:<[point]> offset:0.05 quantity:5 special_data:1.5|<player.flag[dwisp.data.color1]> targets:<[targets]>
                - playeffect effect:redstone at:<[point]> offset:0.1 quantity:5 special_data:0.75|<player.flag[dwisp.data.color2]> targets:<[targets]>
                - flag <player> dwisp.active.location:<[point]>
                - wait 2t
              - drop dwisp_dropped_item[item=<[item]>;custom_name=<&a><[item].display.if_null[<[item].formatted>]>] <player.flag[dwisp.active.location]>
              - repeat 20:
                - playeffect effect:redstone at:<player.flag[dwisp.active.location]> offset:0.05 quantity:5 special_data:1.5|<player.flag[dwisp.data.color1]> targets:<[targets]>
                - playeffect effect:redstone at:<player.flag[dwisp.active.location]> offset:0.1 quantity:5 special_data:0.75|<player.flag[dwisp.data.color2]> targets:<[targets]>
                - wait 2t
              - flag <player> dwisp.active.task:far_idle

            - else:
              - define points <proc[define_curve1].context[<player.flag[dwisp.active.location]>|<player.location.above[2].random_offset[1,0.5,1]>|2|<util.random.int[-20].to[20]>|<player.flag[dwisp.active.location].distance[<player.eye_location>].mul[0.1]>]>
              - define targets <player.location.find_players_within[100]>
              - foreach <[points]> as:point:
                - playeffect effect:redstone at:<[point]> offset:0.05 quantity:5 special_data:1.5|<player.flag[dwisp.data.color1]> targets:<[targets]>
                - playeffect effect:redstone at:<[point]> offset:0.1 quantity:5 special_data:0.75|<player.flag[dwisp.data.color2]> targets:<[targets]>
                - flag <player> dwisp.active.location:<[point]>
                - wait 2t