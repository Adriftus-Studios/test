custom_food_dimsum:
  type: item
  debug: false
  material: apple
  display name: <&a>Dimsum
  data:
    amount: 10
    saturation: 12
  lore:
  - <&e>Hunger: <&f>10 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>12 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 611
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_crop_rice|custom_ingredient_doughitem|custom_crop_waterchestnut|brown_mushroom/red_mushroom/custom_crop_whitemushroom|beef/chicken/cod/mutton/porkchop/rabbit/salmon/tropical_fish