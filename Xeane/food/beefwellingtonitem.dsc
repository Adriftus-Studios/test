custom_food_beefwellington:
  type: item
  debug: false
  material: apple
  display name: <&a>Beef Wellington
  data:
    amount: 11
    saturation: 13
  lore:
  - <&e>Hunger: <&f>11<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>13<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 397
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|beef|custom_ingredient_doughitem|brown_mushroom/red_mushroom/custom_crop_whitemushroom|custom_crop_spinach