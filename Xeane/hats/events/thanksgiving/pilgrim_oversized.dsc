hat_pilgrim_oversized:
  type: data
  hat_data:
    id: pilgrim_hat
    material: clock[custom_model_data=1]
    description: <&a>Thanks for taking the time to celebrate with us!
    display_name: <&a>Oversized Pilgrim Hat (2022)
    item: hat_pilgrim_oversized_item

hat_pilgrim_oversized_item:
  type: item
  material: clock
  display name: <&a>Pilgrim hat (Oversized)
  mechanisms:
    custom_model_data: 2

pilgrim_oversize_unlocker:
  type: world
  debug: false
  events:
    on player right clicks block with:hat_pilgrim_oversized_item using:hand:
      - narrate "<&6>You have unlocked the <&e>Oversized Pilgrim Hat<&6>!"
      - narrate "<&6>Thank you for taking the time out of your holidays to celebrate with us here at Adriftus."
      - take iteminhand
      - run hat_unlock def:hat_pilgrim_oversized player:<player>
      - playsound sound:ENTITY_CHICKEN_AMBIENT <player.location> pitch:1.5
