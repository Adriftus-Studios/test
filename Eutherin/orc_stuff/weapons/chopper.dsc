OrcWeapon_Chopper:
  type: item
  display name: <&f>Orc Chopper
  lore:
  - <&6>Better suited for chopping limbs than trees
  material: iron_axe
  flags:
    custom_durability:
      max: 131
      current: 0
  debug: false
  mechanisms:
    custom_model_data: 3000

orc_chopper_effect:
  type: world
  debug: false
  events:
    on player damages entity with:OrcWeapon_Chopper chance:15:
      - playsound sound:BLOCK_metal_hit <player.location> pitch:0.5 <context.victim.location>
      - determine passively <context.final_damage.mul[1.5]>
      - narrate test
