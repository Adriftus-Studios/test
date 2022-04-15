custom_food_mushroomsteak:
  type: item
  debug: false
  material: apple
  display name: <&a>Mushroom Steak
  data:
    amount: 10
    saturation: 12
  lore:
  - <&e>Hunger: <&f>10<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>12<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 916
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|beef|brown_mushroom/red_mushroom/custom_crop_whitemushroom|custom_ingredient_butteritem|custom_ingredient_blackpepperitem