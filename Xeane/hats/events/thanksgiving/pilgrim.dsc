hat_pilgrim_normal:
  type: data
  hat_data:
    id: pilgrim_hat
    material: clock[custom_model_data=1]
    description: <&a>Thanks for taking the time to celebrate with us!
    display_name: <&a>Pilgrim Hat (2022)
    item: hat_pilgrim_normal_item

hat_pilgrim_normal_item:
  type: item
  material: clock
  display name: <&a>Pilgrim hat
  mechanisms:
    custom_model_data: 1

pilgrim_normal_unlocker:
  type: world
  debug: false
  events:
    on player right clicks block with:hat_pilgrim_normal_item using:hand:
      - narrate pilgrim_hat_normal
      - take iteminhand
      - run hats_unlock def:hat_pilgrim_normal player:<player>
