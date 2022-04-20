custom_food_pineappleupsidedowncake:
  type: item
  debug: false
  material: apple
  display name: <&a>Pineapple Upside-down Cake
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>14<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1025
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_crop_pineapple|custom_ingredient_doughitem|custom_crop_cherry|custom_crop_walnut