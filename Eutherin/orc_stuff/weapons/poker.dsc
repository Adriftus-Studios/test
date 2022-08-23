OrcWeapon_Poker:
  type: item
  display name: <&f>Orc Poker
  lore:
  - <&6>Stick em with the pointy end.
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
  entity_type: armor_stand
  mechanisms:
    item: iron_sword[custom_model_data=3001]
    visible: false
