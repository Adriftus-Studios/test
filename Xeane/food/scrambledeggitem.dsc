custom_food_scrambledegg:
  type: item
  debug: false
  material: apple
  display name: <&a>Scrambled Egg
  data:
    amount: 7
    saturation: 8
  lore:
  - <&e>Hunger: <&f>7 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>8 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 132
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_crop_avocado/custom_crop_banana|milk_bucket/custom_ingredient_freshmilkitem|custom_ingredient_saltitem