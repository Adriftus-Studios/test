custom_food_cheezepuffs:
  type: item
  debug: false
  material: apple
  display name: <&a>Cheeze Puffs
  data:
    amount: 7
    saturation: 8
  lore:
  - <&e>Hunger: <&f>7 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>8 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 492
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_food_cornmeal|custom_food_cheese