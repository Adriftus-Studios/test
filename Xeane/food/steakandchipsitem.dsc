custom_food_steakandchips:
  type: item
  debug: false
  material: apple
  display name: <&a>Steak and Chips
  data:
    amount: 10
    saturation: 12
  lore:
  - <&e>Hunger: <&f>10 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>12 <&chr[0001].font[adriftus:foods]>
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|beef|custom_food_fries