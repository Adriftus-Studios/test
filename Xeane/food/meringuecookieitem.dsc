custom_food_meringuecookie:
  type: item
  debug: false
  material: apple
  display name: <&a>Meringue Cookie
  data:
    amount: 14
    saturation: 17
  lore:
  - <&e>Hunger: <&f>14<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>17<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 888
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_food_meringue|custom_ingredient_doughitem|sugar|custom_food_chocolatebar