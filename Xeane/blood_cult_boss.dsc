blood_cult_boss_start:
  type: task
  debug: false
  script:
    - flag server blood_cult_boss.player:<player>
    - spawn armor_stand[visible=false;marker=true] <location[blood_cult_boss_center].above[4]> save:ent
    - flag server blood_cult_boss.center:<entry[ent].spawned_entity>
    - flag <player> dwisp.active.location:<location[blood_cult_boss_blood_altar]>
    - flag <player> "dwisp.data.name:<&4>Blood Wisp"
    - flag <player> dwisp.data.color1:#990000
    - flag <player> dwisp.data.color2:#FF0000
    - flag <player> dwisp.data.behaviour.heal:self
    - flag player dwisp.data.target:monster if:<player.has_flag[dwisp.data.target].not>
    - define targets <player.location.find_players_within[100]>
    - spawn dwisp_armor_stand[custom_name=<player.flag[dwisp.data.name]>;invincible=false;on_shot=blood_cult_boss_wisp_shot] <location[blood_cult_boss_blood_altar]> save:wisp
    - flag player dwisp.active.entity:<entry[wisp].spawned_entity>
    - flag <entry[wisp].spawned_entity> on_entity_added:cancel
    - flag <entry[wisp].spawned_entity> owner:<player>
    - define points <proc[define_curve1].context[<location[blood_cult_boss_blood_altar]>|<player.location.above[5]>|1|90|0.5]>
    - define targets <player.location.find_players_within[100]>
    - foreach <[points]> as:point:
      - teleport <player.flag[dwisp.active.entity]> <[point].below[0.5]>
      - playeffect effect:redstone at:<[point]> offset:0.05 quantity:5 special_data:1.5|<player.flag[dwisp.data.color1]> targets:<[targets]>
      - playeffect effect:redstone at:<[point]> offset:0.1 quantity:5 special_data:0.75|<player.flag[dwisp.data.color2]> targets:<[targets]>
      - flag player dwisp.active.location:<[point]>
      - wait 2t
    - flag player dwisp.active.follow_target:<server.flag[blood_cult_boss.center]>
    - flag player dwisp.active.task:far_idle
    - run dwisp_run_movement
    - run dwisp_run_behaviour


blood_cult_boss_phase_1:
  type: task
  debug: false
  script:
    - flag server blood_cult_boss.phase:1
    - flag <player> dwisp.data.behaviour.spawn:<context.args.get[3]>
    - wait 10s
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
      - hurt <context.hit_entity> 2
      - wait 1s
    - flag <context.hit_entity> blood_drain:!

blood_cult_boss_phase_2:
  type: task
  debug: false
  script:
    - flag <player> dwisp.data.behaviour.spawn:off
    - flag server blood_cult_boss.phase:2
    - while <server.flag[blood_cult_boss.phase]> == 2:
      - foreach <server.flag[blood_cult_boss_data.points]>:
        - flag player dwisp.active.queued_actions:stay
        - flag player dwisp.active.task:!
        - flag player dwisp.active.stay_target:<[value]>
        - waituntil rate:10t max:100 <player.flag[dwisp.active.location].distance[<[value]>]> < 2:
