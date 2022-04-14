custom_food_stock:
  type: item
  debug: false
  material: apple
  display name: <&a>Stock
  data:
    amount: 5
    saturation: 6
  lore:
  - <&e>Hunger: <&f>5 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>6 <&chr[0001].font[adriftus:foods]>
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|bone/beef/chicken/cod/mutton/porkchop/rabbit/salmon/tropical_fish