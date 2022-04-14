custom_food_orangegingerbeef:
  type: item
  debug: false
  material: apple
  display name: <&a>Orange Ginger Beef
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>14 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 937
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|beef|custom_crop_orange|custom_crop_ginger|custom_crop_scallion|custom_ingredient_soysauceitem