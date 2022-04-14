custom_food_bulgogi:
  type: item
  debug: false
  material: apple
  display name: <&a>Bulgogi
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>14<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 436
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|beef|custom_crop_garlic|custom_ingredient_soysauceitem|sugar|custom_ingredient_blackpepperitem|custom_crop_scallion|custom_crop_ginger|cooking_tool_grinder