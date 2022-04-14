custom_food_pitepalt:
  type: item
  debug: false
  material: apple
  display name: <&a>Pitepalt
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>11 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1030
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|custom_ingredient_flouritem|custom_crop_barley|potato|porkchop|custom_ingredient_saltitem