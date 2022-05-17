blood_cult_boss_start:
  type: task
  debug: false
  script:
    - flag server blood_cult_boss.player:<player>
    - spawn armor_stand[visible=false;marker=true] <location[blood_cult_boss_center].above[1]> save:ent
    - flag server blood_cult_boss_data.center:<entry[ent].spawned_entity>
    - flag <player> dwisp.active.location:<location[blood_cult_boss_blood_altar]>
    - flag <player> "dwisp.data.name:<&4>Blood Wisp"
    - flag <player> dwisp.data.color1:#990000
    - flag <player> dwisp.data.color2:#FF0000
    - flag <player> dwisp.data.behaviour.heal:self
    - flag player dwisp.data.target:monster if:<player.has_flag[dwisp.data.target].not>
    - define targets <player.location.find_players_within[100]>
    - spawn dwisp_armor_stand[custom_name=<player.flag[dwisp.data.name]>] <location[blood_cult_boss_blood_altar]> save:wisp
    - flag <entry[wisp].spawned_entity> on_shot:blood_cult_boss_wisp_shot
    - flag player dwisp.active.entity:<entry[wisp].spawned_entity>
    - flag <entry[wisp].spawned_entity> on_entity_added:cancel
    - flag <entry[wisp].spawned_entity> owner:<player>
    - define points <proc[define_curve1].context[<location[blood_cult_boss_blood_altar]>|<server.flag[blood_cult_boss_data.center].location.above[3].backward[3]>|4|90|0.5]>
    - define targets <player.location.find_players_within[100]>
    - foreach <[points]> as:point:
      - teleport <player.flag[dwisp.active.entity]> <[point].below[0.5]>
      - playeffect effect:redstone at:<[point]> offset:0.05 quantity:5 special_data:1.5|<player.flag[dwisp.data.color1]> targets:<[targets]>
      - playeffect effect:redstone at:<[point]> offset:0.1 quantity:5 special_data:0.75|<player.flag[dwisp.data.color2]> targets:<[targets]>
      - flag player dwisp.active.location:<[point]>
      - wait 2t
    - flag player dwisp.active.follow_target:<server.flag[blood_cult_boss_data.center]>
    - flag player dwisp.active.task:far_idle
    - run dwisp_run_movement
    - run dwisp_run_behaviour
    - run blood_cult_boss_phase_1


blood_cult_boss_phase_1:
  type: task
  debug: false
  script:
    - flag server blood_cult_boss.phase:1
    - flag <player> dwisp.data.behaviour.spawn:blood_cult_boss_mob_1
    - wait 30s
    - run blood_cult_boss_phase_2

blood_cult_boss_mob_1:
  type: entity
  debug: false
  entity_type: skeleton
  mechanisms:
    health_data: 100/100
    custom_name: <&c>Blood Skeleton
    custom_name_visible: true
  flags:
    on_targetting: blood_cult_boss_mob_targetting
    on_shoots_bow: blood_cult_boss_bow_shoot

blood_cult_boss_mob_targetting:
  type: task
  debug: false
  script:
    - if <context.target.entity_type> != PLAYER:
      - determine cancelled
    - if <context.target> == <server.flag[blood_cult_boss.player]>:
      - determine cancelled

blood_cult_boss_bow_shoot:
  type: task
  debug: false
  script:
    - wait 1t
    - flag <context.projectile> on_hit_entity:blood_cult_boss_bow_damage
    - while <context.projectile.is_spawned>:
      - playeffect at:<context.projectile.location> effect:redstone special_data:5|#990000 offset:0 quantity:2 targets:<server.online_players>
      - wait 1t
      - if <[loop_index]> > 80:
        - while stop

blood_cult_boss_bow_damage:
  type: task
  debug: false
  script:
    - determine passively cancelled
    - if <context.hit_entity.has_Flag[blood_drain]> || <context.hit_entity> == <server.flag[blood_cult_boss.player]>:
      - stop
    - flag <context.hit_entity> blood_drain
    - repeat 5:
      - if !<context.hit_entity.is_spawned>:
        - repeat stop
      - hurt <context.hit_entity> 4
      - wait 1s
    - flag <context.hit_entity> blood_drain:!

blood_cult_boss_phase_2:
  type: task
  debug: false
  script:
    - flag <player> dwisp.data.behaviour.spawn:off
    - flag <player> dwisp.data.behaviour.attack:PLAYER
    - flag <player> dwisp.data.damage:2
    - flag server blood_cult_boss.phase:2
    - while <server.flag[blood_cult_boss.phase]> == 2:
      - foreach <server.flag[blood_cult_boss_data.points]>:
        - flag player dwisp.active.queued_actions:->:stay
        - flag player dwisp.active.task:!
        - flag player dwisp.active.stay_target:<[value]>
        - wait 2s

blood_cult_boss_phase_3:
  type: task
  debug: false
  script:
    - flag player dwisp.active.stay_target:<server.flag[blood_cult_boss_data.center]>
    - flag player dwisp.active.queued_actions:->:stay
    - flag player dwisp.active.task:!

blood_cult_boss_wisp_shot:
  type: task
  debug: false
  script:
    - if <server.flag[blood_cult_boss.phase]> == 3:
      - flag <server.flag[blood_cult_boss.player]> dwisp.active.queued_actions:<list[immediate_despawn]>
      - flag <server.flag[blood_cult_boss.player]> dwisp.active.task:!

blood_cult_boss_stage_4:
  type: task
  debug: false
  script:
    - define curry <server.match_player[Xeane].if_null[null]>
    - if <[curry]> == null:
      - stop
    - define targets <player.location.find_players_within[100]>
    - define points <location[blood_cult_boss_blood_altar].points_between[<location[blood_cult_boss_blood_altar].above[5]>].distance[0.25]>
    - foreach <[points]> as:point:
      - playeffect effect:redstone at:<[point]> offset:0.05 quantity:5 special_data:1.5|<player.flag[dwisp.data.color1]> targets:<[targets]>
      - playeffect effect:redstone at:<[point]> offset:0.1 quantity:5 special_data:0.75|<player.flag[dwisp.data.color2]> targets:<[targets]>
      - wait 1t
    - repeat 120:
      - playeffect effect:redstone at:<location[blood_cult_boss_blood_altar].above[5]> offset:0.05 quantity:5 special_data:1.5|<player.flag[dwisp.data.color1]> targets:<[targets]>
      - playeffect effect:redstone at:<location[blood_cult_boss_blood_altar].above[5]> offset:0.1 quantity:5 special_data:0.75|<player.flag[dwisp.data.color2]> targets:<[targets]>
      - wait 1t
    - repeat 40:
      - playeffect effect:redstone at:<location[blood_cult_boss_blood_altar].above[5]> offset:0.05 quantity:5 special_data:2|<player.flag[dwisp.data.color1]> targets:<[targets]>
      - playeffect effect:redstone at:<location[blood_cult_boss_blood_altar].above[5]> offset:0.1 quantity:5 special_data:1|<player.flag[dwisp.data.color2]> targets:<[targets]>
      - run blood_cult_stage_4_beam def:<[curry].eye_location>
      - wait 5t

blood_cult_stage_4_beam:
  type: task
  debug: false
  definitions: target
  script:
    - define points <proc[define_curve1].context[<location[blood_cult_boss_blood_altar].above[5]>|<server.flag[blood_cult_boss_data.center].above[3]>|3|<util.random.int[1].to[359]>|0.5]>
    - define targets <player.location.find_players_within[100]>
    - foreach <[points]> as:point:
      - playeffect effect:redstone at:<[point]> offset:0.05 quantity:5 special_data:1|<player.flag[dwisp.data.color1]> targets:<[targets]>
      - playeffect effect:redstone at:<[point]> offset:0.1 quantity:5 special_data:0.5|<player.flag[dwisp.data.color2]> targets:<[targets]>
      - wait 1t