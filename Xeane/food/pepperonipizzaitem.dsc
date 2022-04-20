custom_food_pepperonipizza:
  type: item
  debug: false
  material: apple
  display name: <&a>Pepperoni Pizza
  data:
    amount: 16
    saturation: 19
  lore:
  - <&e>Hunger: <&f>16<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>19<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1005
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_ingredient_doughitem|custom_crop_tomato|custom_food_cheese|custom_food_pepperoni