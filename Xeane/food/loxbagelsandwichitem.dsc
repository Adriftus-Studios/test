custom_food_loxbagelsandwich:
  type: item
  debug: false
  material: apple
  display name: <&a>Lox Bagel Sandwich
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>14 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 848
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|cod/salmon/tropical_fish|custom_food_toast|custom_ingredient_creamitem|custom_crop_scallion