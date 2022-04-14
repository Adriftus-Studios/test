custom_food_ceasarsalad:
  type: item
  debug: false
  material: apple
  display name: <&a>Ceasar Salad
  data:
    amount: 22
    saturation: 26
  lore:
  - <&e>Hunger: <&f>22 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>26 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 481
  recipes:
    1:
      type: shapeless
      input: cooking_tool_mixingbowl|custom_crop_lettuce|custom_food_toast|custom_food_cheese|custom_crop_garlic|custom_ingredient_blackpepperitem|custom_ingredient_saladdressingitem