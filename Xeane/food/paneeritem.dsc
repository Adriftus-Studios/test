custom_food_paneer:
  type: item
  debug: false
  material: apple
  display name: <&a>Paneer
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>11 <&chr[0001].font[adriftus:foods]>
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|milk_bucket/custom_ingredient_freshmilkitem|custom_ingredient_vinegaritem|custom_crop_lemon