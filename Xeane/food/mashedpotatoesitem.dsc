custom_food_mashedpotatoes:
  type: item
  debug: false
  material: apple
  display name: <&a>Mashed Potatoes
  data:
    amount: 11
    saturation: 13
  lore:
  - <&e>Hunger: <&f>11<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>13<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 875
  recipes:
    1:
      type: shapeless
      input: cooking_tool_mixingbowl|baked_potato|custom_ingredient_butteritem|custom_ingredient_saltitem