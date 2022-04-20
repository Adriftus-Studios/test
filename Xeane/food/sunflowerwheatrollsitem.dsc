custom_food_sunflowerwheatrolls:
  type: item
  debug: false
  material: apple
  display name: <&a>Sunflower Wheat Rolls
  data:
    amount: 10
    saturation: 12
  lore:
  - <&e>Hunger: <&f>10<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>12<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1186
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_food_sunflowerseeds|custom_food_sunflowerseeds|custom_food_sunflowerseeds|custom_ingredient_flouritem|custom_ingredient_saltitem|custom_ingredient_cookingoilitem