custom_food_meatfeastpizza:
  type: item
  debug: false
  material: apple
  display name: <&a>Meat Feast Pizza
  data:
    amount: 27
    saturation: 32
  lore:
  - <&e>Hunger: <&f>27<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>32<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 878
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_ingredient_doughitem|custom_crop_tomato|custom_food_cheese|custom_food_pepperoni|custom_food_sausage|beef|chicken