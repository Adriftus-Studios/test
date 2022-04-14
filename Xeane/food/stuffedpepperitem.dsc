custom_food_stuffedpepper:
  type: item
  debug: false
  material: apple
  display name: <&a>Stuffed Pepper
  data:
    amount: 8
    saturation: 10
  lore:
  - <&e>Hunger: <&f>8 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>10 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1176
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_crop_bellpepper|custom_crop_tomato|custom_crop_rice