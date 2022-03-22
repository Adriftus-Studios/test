scythe_test:
  type: task
  debug: false
  script:
    - spawn armor_stand[marker=true;visible=false;equipment=air|air|air|stick[custom_model_data=666]] <player.location> save:as
    - mount <entry[as].spawned_entity>|<player>
    - flag <player> test.scythe:<entry[as].spawned_entity>
    - flag <entry[as].spawned_entity> on_dismount:cancel
    - while <player.passenger> == <entry[as].spawned_entity>:
      - look <entry[as].spawned_entity> <player.location.forward[30]>
      - wait 1t

scythe_test_stop:
  type: task
  debug: false
  script:
    - remove <player.flag[test.scythe]>
    - flag <player> test.scythe:!