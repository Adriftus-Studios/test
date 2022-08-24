OrcWeapon_Sparkler:
  type: item
  display name: <&f>Orc Sparkler
  lore:
  - <&6>Wonder how you use this.
  material: iron_shovel
  flags:
    custom_durability:
      max: 10
      current: 0
  debug: false
  mechanisms:
    custom_model_data: 3001

orc_bolt_test:
  type: task
  debug: false
  script:
  - shoot OrcWeapon_Sparkler_projectile save:shot speed:1.5 origin:<player.location.above[1.5].right[0.25]>
  - run OrcWeapon_Sparkler_projectile_remover def.proj:<entry[shot].shot_entity>
  - flag <entry[shot].shot_entity> on_hit_entity:orc_poker_hits_entity
  - flag <entry[shot].shot_entity> custom_damage.cause:<player.name><&sq><&6>Orcish<&sp>Spear.
  - while <entry[shot].shot_entity.is_spawned>:
    - playeffect effect:redstone quantity:10 special_data:2|0,250,0 at:<entry[shot].shot_entity.location> offset:0.15
    - playeffect effect:redstone at:<entry[shot].shot_entity.location> quantity:2 special_data:3|0,125,0 offset:0.2
    - wait 2t
OrcWeapon_Sparkler_projectile:
  type: entity
  debug: false
  entity_type: snowball
  mechanisms:
    item: feather[custom_model_data=1]
    gravity: false

OrcWeapon_Sparkler_projectile_remover:
  type: task
  debug: false
  deefinitions: proj
  script:
    - wait 60t
    - if <[proj].is_spawned>:
      - remove <[proj]>
