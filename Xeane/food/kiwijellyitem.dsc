custom_food_kiwijelly:
  type: item
  debug: false
  material: apple
  display name: <&a>Kiwi Jelly
  data:
    amount: 4
    saturation: 5
  lore:
  - <&e>Hunger: <&f>4 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>5 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 217
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|custom_crop_kiwi|sugar