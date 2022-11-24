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
  flags:
    on_right_click: run hat_unlock def:hat_pilgrim_oversized
