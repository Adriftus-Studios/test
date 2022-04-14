custom_food_gingeredrhubarbtart:
  type: item
  debug: false
  material: apple
  display name: <&a>Ginger Rhubarb
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>11<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 695
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_ingredient_doughitem|custom_crop_rhubarb|custom_crop_ginger|sugar|custom_crop_avocado/custom_crop_banana