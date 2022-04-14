custom_food_splitpeasoup:
  type: item
  debug: false
  material: apple
  display name: <&a>Split Pea Soup
  data:
    amount: 14
    saturation: 17
  lore:
  - <&e>Hunger: <&f>14 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>17 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1149
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_crop_peas|porkchop|custom_ingredient_blackpepperitem|custom_food_stock