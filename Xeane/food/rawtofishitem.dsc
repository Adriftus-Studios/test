custom_food_rawtofish:
  type: item
  debug: false
  material: apple
  display name: <&a>Raw Tofish
  data:
    amount: 3
    saturation: 4
  lore:
  - <&e>Hunger: <&f>3<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>4<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1100
  recipes:
    1:
      type: shapeless
      input: cooking_tool_mixingbowl|custom_food_firmtofu|custom_ingredient_soysauceitem|kelp