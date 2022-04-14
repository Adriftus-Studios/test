custom_food_datejuice:
  type: item
  debug: false
  material: apple
  display name: <&a>Date Juice
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>11 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 600
  recipes:
    1:
      type: shapeless
      input: cooking_tool_juicer|custom_crop_date|custom_crop_date