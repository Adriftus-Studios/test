custom_food_icecream:
  type: item
  debug: false
  material: apple
  display name: <&a>Ice Cream
  data:
    amount: 6
    saturation: 7
  lore:
  - <&e>Hunger: <&f>6<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>7<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 49
  recipes:
    1:
      type: shapeless
      input: cooking_tool_mixingbowl|milk_bucket/custom_ingredient_freshmilkitem|custom_ingredient_saltitem|blue_ice/ice/packed_ice/snowball