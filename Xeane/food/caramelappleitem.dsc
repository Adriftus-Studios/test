custom_food_caramelapple:
  type: item
  debug: false
  material: apple
  display name: <&a>Caramel Apple
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>11<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 469
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|custom_food_caramel|apple