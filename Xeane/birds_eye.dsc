birds_eye:
  type: task
  debug: false
  script:
    - spawn armor_stand[visible=false] <player.location.with_pitch[90]> save:ent
    - fakeequip <player> hand:feather[display=<&a>;custom_model_data=3] duration:12s
    - adjust <player> spectate:<entry[ent].spawned_entity>
    - flag <player> birds_eye
    - flag <player> test_entity:<entry[ent].spawned_entity>
    - repeat 120:
      - adjust <entry[ent].spawned_entity> velocity:0,1,0
      - wait 1t
    - adjust <entry[ent].spawned_entity> gravity:false
    - teleport <entry[ent].spawned_entity> <entry[ent].spawned_entity.location.forward_flat[1200]>
    - wait 5s
    - adjust <player> spectate:<player>
    - remove <entry[ent].spawned_entity>
    - flag <player> birds_eye:!
    - flag <player> test_entity:!
