custom_food_marzipan:
  type: item
  debug: false
  material: apple
  display name: <&a>Marzipan
  data:
    amount: 8
    saturation: 10
  lore:
  - <&e>Hunger: <&f>8 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>10 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 873
  recipes:
    1:
      type: shapeless
      input: cooking_tool_mixingbowl|honey_bottle|custom_crop_almond