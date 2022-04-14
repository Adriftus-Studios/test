custom_food_lycheejelly:
  type: item
  debug: false
  material: apple
  display name: <&a>Lychee Jelly
  data:
    amount: 6
    saturation: 7
  lore:
  - <&e>Hunger: <&f>6 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>7 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 220
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|custom_crop_lychee|sugar