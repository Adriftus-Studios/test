custom_food_breadfruitjuice:
  type: item
  debug: false
  material: apple
  display name: <&a>Breadfruit Juice
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>11 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 426
  recipes:
    1:
      type: shapeless
      input: cooking_tool_juicer|custom_crop_breadfruit|custom_crop_breadfruit