custom_food_garlicmashedpotatoes:
  type: item
  debug: false
  material: apple
  display name: <&a>Garlic Mashed Potatoes
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>14<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 690
  recipes:
    1:
      type: shapeless
      input: cooking_tool_mixingbowl|custom_ingredient_saltitem|custom_ingredient_butteritem|baked_potato|custom_crop_garlic