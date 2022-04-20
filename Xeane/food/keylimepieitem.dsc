custom_food_keylimepie:
  type: item
  debug: false
  material: apple
  display name: <&a>Key Lime Pie
  data:
    amount: 13
    saturation: 16
  lore:
  - <&e>Hunger: <&f>13<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>16<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 808
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_crop_lime|custom_food_meringue|sugar|custom_ingredient_doughitem