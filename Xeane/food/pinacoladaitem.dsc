custom_food_pinacolada:
  type: item
  debug: false
  material: apple
  display name: <&a>Pina Colada
  data:
    amount: 8
    saturation: 10
  lore:
  - <&e>Hunger: <&f>8 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>10 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1018
  recipes:
    1:
      type: shapeless
      input: cooking_tool_mixingbowl|custom_crop_coconut|custom_crop_pineapple