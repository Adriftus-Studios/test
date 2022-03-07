confetti_snowball:
  type: item
  debug: false
  material: snowball
  display name: <&6>Confetti Snowball
  lore:
  - <&e>A reward from the 2021 Adriftus Christmas Advent.
  - <&e>Thank you for taking the time to celebrate with us.
  - <&a>Blast some confetti!
  mechanisms:
    custom_model_data: 1

confetti_snowball_shooter:
  type: world
  debug: false
  events:
    on player right clicks block with:confetti_snowball:
      - determine passively cancelled
      - ratelimit <player> 2t
      - playsound sound:ENTITY_SNOWBALL_THROW <player.location> pitch:0.1 volume:0.4
      - shoot snowball[item=snowball[custom_model_data=1]] speed:2 script:confetti_explosion




confetti_explosion:
  type: task
  debug: false
  definitions: location
  script:
    - define colors <list[22,255,216|241,134,255|241,228,47|0,200,0]>
    - repeat 10:
      - playeffect effect:redstone at:<[location]> visibility:50 quantity:20 special_data:<util.random.int[1].to[3]>|<util.random.int[0].to[255]>,<util.random.int[0].to[255]>,<util.random.int[0].to[255]> offset:0.5



confetti_ball_stand:
  type: entity
  entity_type: armor_stand
  mechanisms:
    equipment: air|air|air|confetti_snowball
    visible: false
    gravity: true
