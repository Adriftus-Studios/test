custom_food_pastagardenia:
  type: item
  debug: false
  material: apple
  display name: <&a>Pasta Gardenia
  data:
    amount: 15
    saturation: 18
  lore:
  - <&e>Hunger: <&f>15 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>18 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 968
  recipes:
    1:
      type: shapeless
      input: cooking_tool_mixingbowl|custom_ingredient_pastaitem|custom_ingredient_cookingoilitem|custom_crop_tomato|custom_crop_spiceleaf|custom_food_cheese