custom_food_friedgreentomatoes:
  type: item
  debug: false
  material: apple
  display name: <&a>Fried Green Tomatoes
  data:
    amount: 10
    saturation: 12
  lore:
  - <&e>Hunger: <&f>10 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>12 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 675
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_crop_tomato|custom_ingredient_cookingoilitem|custom_ingredient_batteritem