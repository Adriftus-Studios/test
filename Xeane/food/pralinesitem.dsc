custom_food_pralines:
  type: item
  debug: false
  material: apple
  display name: <&a>Pralines
  data:
    amount: 3
    saturation: 4
  lore:
  - <&e>Hunger: <&f>3<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>4<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1067
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|sugar|custom_crop_pecan