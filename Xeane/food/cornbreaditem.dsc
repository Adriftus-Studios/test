custom_food_cornbread:
  type: item
  debug: false
  material: apple
  display name: <&a>Cornbread
  data:
    amount: 3
    saturation: 4
  lore:
  - <&e>Hunger: <&f>3 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>4 <&chr[0001].font[adriftus:foods]>
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_food_cornmeal