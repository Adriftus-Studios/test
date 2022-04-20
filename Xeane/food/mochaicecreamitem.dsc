custom_food_mochaicecream:
  type: item
  debug: false
  material: apple
  display name: <&a>Mocha Ice Cream
  data:
    amount: 7
    saturation: 8
  lore:
  - <&e>Hunger: <&f>7<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>8<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 898
  recipes:
    1:
      type: shapeless
      input: cooking_tool_mixingbowl|custom_food_icecream|custom_crop_coffeebean|custom_ingredient_cocoapowderitem