custom_food_gyudon:
  type: item
  debug: false
  material: apple
  display name: <&a>Gyudon
  data:
    amount: 8
    saturation: 10
  lore:
  - <&e>Hunger: <&f>8<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>10<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 754
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|beef|custom_crop_onion|custom_crop_scallion|custom_crop_ginger|custom_crop_rice