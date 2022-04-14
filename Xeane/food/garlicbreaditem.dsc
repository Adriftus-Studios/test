custom_food_garlicbread:
  type: item
  debug: false
  material: apple
  display name: <&a>Garlic Bread
  data:
    amount: 10
    saturation: 12
  lore:
  - <&e>Hunger: <&f>10 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>12 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 688
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_crop_garlic|custom_food_toast|custom_ingredient_butteritem