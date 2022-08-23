OrcWeapon_Poker:
  type: item
  display name: <&f>Orc Poker
  lore:
  - <&6>Stick em with the pointy end.
  - <&e>Right Click <&6>to throw.
  material: iron_sword
  flags:
    custom_durability:
      max: 132
      current: 0
  debug: false
  mechanisms:
    custom_model_data: 3000

OrcWeapon_Poker_projectile:
  type: entity
  debug: false
  entity_type: snowball
  mechanisms:
    item: iron_sword[custom_model_data=3001]

OrcWeapon_Poker_shoot:
  type: world
  debug: false
  events:
    on player right clicks block with:OrcWeapon_Poker:
      - ratelimit <player> 100t
      - itemcooldown <player.item_in_hand.material> duration:100t
      - shoot OrcWeapon_Poker_projectile shooter:<player> speed:2 origin:<player.location.above[1.5].right[0.25]> save:shot
      - flag <entry[shot].shot_entity> on_hit_entity:orc_poker_hits_entity
      - playsound sound:BLOCK_DISPENSER_LAUNCH <player.location>
      - define value 13
      - define slot <player.held_item_slot>
      - inject custom_durability_process_task


orc_poker_hits_entity:
  type: task
  debug: false
  script:
    - if <context.hit_entity.location.town.exists>:
      - if <context.hit_entity.location.town> != <context.projectile.shooter.town.if_null[null]>:
        - stop
    - if <list[armor_stand|item_frame|glow_item_frame].contains_any[<context.hit_entity.entity_type>]> == armor_stand || <context.hit_entity.script.exists>:
      - stop
    - hurt <context.hit_entity> 6 source:player
