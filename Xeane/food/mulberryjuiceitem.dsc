custom_food_mulberryjuice:
  type: item
  debug: false
  material: apple
  display name: <&a>Mulberry Juice
  data:
    amount: 5
    saturation: 6
  lore:
  - <&e>Hunger: <&f>5 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>6 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 906
  recipes:
    1:
      type: shapeless
      input: cooking_tool_juicer|custom_crop_mulberry|custom_crop_mulberry