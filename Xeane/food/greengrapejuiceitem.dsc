custom_food_greengrapejuice:
  type: item
  debug: false
  material: apple
  display name: <&a>Green Grape Juice
  data:
    amount: 5
    saturation: 6
  lore:
  - <&e>Hunger: <&f>5 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>6 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 734
  recipes:
    1:
      type: shapeless
      input: cooking_tool_juicer|custom_crop_greengrape|custom_crop_greengrape