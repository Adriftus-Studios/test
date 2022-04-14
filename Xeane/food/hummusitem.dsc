custom_food_hummus:
  type: item
  debug: false
  material: apple
  display name: <&a>Hummus
  data:
    amount: 8
    saturation: 10
  lore:
  - <&e>Hunger: <&f>8 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>10 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 785
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_crop_chickpea|custom_crop_garlic|custom_crop_lemon|custom_ingredient_cookingoilitem