custom_food_springsalad:
  type: item
  debug: false
  material: apple
  display name: <&a>Spring Salad
  data:
    amount: 13
    saturation: 16
  lore:
  - <&e>Hunger: <&f>13 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>16 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1152
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_crop_lettuce|custom_crop_avocado/custom_crop_olive|custom_ingredient_saladdressingitem