custom_food_guavajuice:
  type: item
  debug: false
  material: apple
  display name: <&a>Guava Juice
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>11 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 747
  recipes:
    1:
      type: shapeless
      input: cooking_tool_juicer|custom_crop_guava|custom_crop_guava