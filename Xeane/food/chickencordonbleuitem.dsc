custom_food_chickencordonbleu:
  type: item
  debug: false
  material: apple
  display name: <&a>Chicken Cordonbleu
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>14 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 508
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|chicken|porkchop|custom_ingredient_flouritem|custom_food_cheese