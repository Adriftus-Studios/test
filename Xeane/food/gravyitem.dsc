custom_food_gravy:
  type: item
  debug: false
  material: apple
  display name: <&a>Gravy
  data:
    amount: 8
    saturation: 10
  lore:
  - <&e>Hunger: <&f>8 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>10 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 729
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_food_stock|custom_ingredient_flouritem