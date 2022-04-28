blood_magic_deflect_attack:
  type: task
  debug: false
  script:
    - playeffect effect:redstone quantity:5 offset:0.05 special_data:3|#990000 at:<context.damager.precise_target_position> visibility:100
    - determine cancelled