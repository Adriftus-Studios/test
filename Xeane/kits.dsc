iron_armor_pack:
  type: item
  material: chest
  display name: <&f>Iron Kit
  flags:
    on_right_click: iron_armor_pack_give

iron_armor_pack_give:
  type: task
  debug: false
  script:
    - determine passively cancelled
    - wait 1t
    - take iteminhand
    - give iron_helmet|iron_chestplate|iron_leggings|iron_boots|iron_sword

diamond_armor_pack:
  type: item
  material: chest
  display name: <&b>Diamond Kit
  flags:
    on_right_click: diamond_armor_pack_give

diamond_armor_pack_give:
  type: task
  debug: false
  script:
    - determine passively cancelled
    - wait 1t
    - take iteminhand
    - give diamond_helmet|diamond_chestplate|diamond_leggings|diamond_boots|diamond_sword