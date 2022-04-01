scythe_test:
  type: task
  debug: false
  script:
    - spawn armor_stand[marker=true;visible=false;equipment=air|air|air|stick[custom_model_data=666]] <player.location> save:as
    - mount <entry[as].spawned_entity>|<player>
    - flag <player> test.scythe:<entry[as].spawned_entity>
    - flag <entry[as].spawned_entity> on_dismount:cancel_if_spawned
    - while <player.passenger> == <entry[as].spawned_entity>:
      - look <entry[as].spawned_entity> yaw:<player.location.yaw>
      - wait 1t
    - kill <entry[as].spawned_entity>
    - remove <entry[as].spawned_entity>

scythe_test_stop:
  type: task
  debug: false
  script:
    - remove <player.flag[test.scythe]>
    - flag <player> test.scythe:!
