birds_eye:
  type: task
  debug: false
  script:
    - spawn armor_stand[visible=false] <player.location.with_pitch[75]> save:ent
    - fakeequip <player> hand:feather[display=<&a>;custom_model_data=3] duration:12s
    - adjust <player> spectate:<entry[ent].spawned_entity>
    - flag <player> birds_eye
    - flag <player> test_entity:<entry[ent].spawned_entity>
    - adjust <entry[ent].spawned_entity> velocity:0,1,0
    - spawn boat[gravity=false] <player.location.above[140]> save:boat
    - spawn boat[gravity=false] <player.location> save:boat2
    - mount <player>|<entry[boat].spawned_entity>
    - repeat 40:
      - adjust <entry[ent].spawned_entity> velocity:0,1,0
      - wait 1t
    - adjust <entry[ent].spawned_entity> gravity:false
    - repeat 120:
      - define loc <entry[boat].spawned_entity.location.with_y[<entry[ent].spawned_entity.location.y>].with_pitch[75]>
      - teleport <entry[ent].spawned_entity> <[loc]>
      - teleport <entry[boat2].spawned_entity> <[loc].precise_cursor_on>
      - wait 1t
    - adjust <player> spectate:<player>
    - remove <entry[ent].spawned_entity>
    - remove <entry[boat].spawned_entity>
    - flag <player> birds_eye:!
    - flag <player> test_entity:!