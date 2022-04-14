custom_food_stuffedmushroom:
  type: item
  debug: false
  material: apple
  display name: <&a>Stuffed Mushroom
  data:
    amount: 11
    saturation: 13
  lore:
  - <&e>Hunger: <&f>11 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>13 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1175
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|brown_mushroom/red_mushroom/custom_crop_whitemushroom|custom_food_cheese|custom_food_toast