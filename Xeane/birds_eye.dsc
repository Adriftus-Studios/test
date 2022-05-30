birds_eye:
  type: task
  debug: false
  script:
    - spawn armor_stand[visible=false] <player.location.with_pitch[90]> save:ent
    - adjust <player> spectate:<entry[ent].spawned_entity>
    - repeat 120:
      - adjust <entry[ent].spawned_entity> velocity:0,1,0
    - adjust <entry[ent].spawned_entity> gravity:false