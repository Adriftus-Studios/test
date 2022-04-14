custom_food_lemonjuice:
  type: item
  debug: false
  material: apple
  display name: <&a>Lemon Juice
  data:
    amount: 3
    saturation: 4
  lore:
  - <&e>Hunger: <&f>3 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>4 <&chr[0001].font[adriftus:foods]>
  recipes:
    1:
      type: shapeless
      input: cooking_tool_juicer|custom_crop_lemon|custom_crop_lemon