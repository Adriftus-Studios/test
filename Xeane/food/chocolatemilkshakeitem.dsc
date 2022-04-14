custom_food_chocolatemilkshake:
  type: item
  debug: false
  material: apple
  display name: <&a>Chocolate Milk
  data:
    amount: 6
    saturation: 7
  lore:
  - <&e>Hunger: <&f>6 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>7 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 537
  recipes:
    1:
      type: shapeless
      input: cooking_tool_mixingbowl|milk_bucket/custom_ingredient_freshmilkitem|custom_ingredient_cocoapowderitem|blue_ice/ice/packed_ice/snowball