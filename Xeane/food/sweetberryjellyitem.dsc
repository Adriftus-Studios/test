custom_food_sweetberryjelly:
  type: item
  debug: false
  material: apple
  display name: <&a>Sweet Berry Jelly
  data:
    amount: 3
    saturation: 4
  lore:
  - <&e>Hunger: <&f>3 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>4 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 214
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|custom_food_sweetberryjuice|sugar