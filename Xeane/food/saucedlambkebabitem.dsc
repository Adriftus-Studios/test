custom_food_saucedlambkebab:
  type: item
  debug: false
  material: apple
  display name: <&a>Sauced Lamb Kebabs
  data:
    amount: 17
    saturation: 20
  lore:
  - <&e>Hunger: <&f>17<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>20<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1115
  recipes:
    1:
      type: shapeless
      input: cooking_tool_mixingbowl|custom_food_lambkebab|custom_food_yogurt