custom_food_sweetpickle:
  type: item
  debug: false
  material: apple
  display name: <&a>Sweet Pickle
  data:
    amount: 10
    saturation: 12
  lore:
  - <&e>Hunger: <&f>10 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>12 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1199
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_ingredient_vinegaritem|custom_crop_cucumber|sugar