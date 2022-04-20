custom_food_mochidessert:
  type: item
  debug: false
  material: apple
  display name: <&a>Mochi
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>11<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 900
  recipes:
    1:
      type: shapeless
      input: cooking_tool_mixingbowl|custom_food_mochi|custom_food_icecream