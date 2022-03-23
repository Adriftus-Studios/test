scythe_test:
  type: task
  debug: false
  script:
    - create armor_stand[marker=true;visible=false;equipment=air|air|air|stick[custom_model_data=666]] <player.location> registry:attachments save:as
    - mount <entry[as].created_npc>|<player>
    - flag <player> test.scythe:<entry[as].created_npc>
    - flag <entry[as].created_npc> on_dismount:cancel_if_spawned
    - while <player.passenger> == <entry[as].created_npc>:
      - look <entry[as].created_npc> yaw:<player.location.yaw>
      - wait 1t
    - despawn <entry[as].created_npc>

scythe_test_stop:
  type: task
  debug: false
  script:
    - remove <player.flag[test.scythe]>
    - flag <player> test.scythe:!
