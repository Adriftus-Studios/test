custom_food_garlicsteak:
  type: item
  debug: false
  material: apple
  display name: <&a>Garlic Steak
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>11<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 691
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|beef|custom_crop_garlic|custom_ingredient_butteritem|custom_crop_spiceleaf