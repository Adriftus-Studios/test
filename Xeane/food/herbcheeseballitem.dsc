custom_food_herbcheeseball:
  type: item
  debug: false
  material: apple
  display name: <&a>Herb Cheese Ball
  data:
    amount: 6
    saturation: 7
  lore:
  - <&e>Hunger: <&f>6 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>7 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 765
  recipes:
    1:
      type: shapeless
      input: cooking_tool_mixingbowl|custom_food_cheese|custom_crop_spiceleaf