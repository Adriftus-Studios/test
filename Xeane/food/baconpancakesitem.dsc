custom_food_baconpancakes:
  type: item
  debug: false
  material: apple
  display name: <&a>Bacon Pancakes
  data:
    amount: 15
    saturation: 18
  lore:
  - <&e>Hunger: <&f>15 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>18 <&chr[0001].font[adriftus:foods]>
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_ingredient_batteritem|milk_bucket/custom_ingredient_freshmilkitem|cooked_porkchop