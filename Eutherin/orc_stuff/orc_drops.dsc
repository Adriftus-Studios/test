mythic_item_dropper:
  Type: world
  Debug: false
  Events:
    On mythicmob mob killed by:player:
      - define name <context.entity.mythicmob.internal_name>
      - if <util.random.int[1].to[100]> <= <script[mythic_drop_rates].data_key[mob.<[name]>]>
      - choose <[name]>:
        - case Orc:
          - define drop OrcTool_pickaxe
        - case OrcAdept:
          - define drop OrcWeapon_Sparkler
        - case OrcShaman:
          - define drop OrcWeapon_Zapper
        - case OrcBerserker:
          - define drop OrcWeapon_Chopper
        - case OrcChampion:
          - define drop OrcWeapon_Crusher
#        - case OrcArcher:
#          - define drop OrcWeapon
#        - case OrcWargmaster:
#          - define drop OrcWeapon
#        - case OrcDrummer:
#          - define drop OrcWeapon
        - case OrcBeastmaster:
          - define drop OrcWeapon_Poker
        - case default:
          - stop
      - drop <[drop]> <context.entity.location>

mythic_drop_rates:
  type: data
  data:
    mob:
      Orc: 1
      OrcAdept: 1
      OrcShaman: 1
      OrcBerserker: 1
      OrcChampion: 1
      OrcBeastmaster: 1

OrcWeapon_Slicer:
  type: item
  display name: <&f>Orc Slicer
  lore:
  - <&6>Has a very crude, jagged edge.
  material: iron_sword
  flags:
    custom_durability:
      max: 132
      current: 0
  debug: false
  mechanisms:
    custom_model_data: 3000

OrcWeapon_Crusher:
  type: item
  display name: <&f>Orc Crusher
  lore:
  - <&6>Sometimes brute force is supreme.
  material: iron_axe
  flags:
    custom_durability:
      max: 132
      current: 0
  debug: false
  mechanisms:
    custom_model_data: 3001

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

OrcWeapon_zapper:
  type: item
  display name: <&f>Orc Zapper
  lore:
  - <&5>Wonder how you use this
  material: iron_shovel
  flags:
    custom_durability:
      max: 10
      current: 0
  debug: false
  mechanisms:
    custom_model_data: 3000
