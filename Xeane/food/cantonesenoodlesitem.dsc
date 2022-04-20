custom_food_cantonesenoodles:
  type: item
  debug: false
  material: apple
  display name: <&a>Cantonese Noodles
  data:
    amount: 25
    saturation: 30
  lore:
  - <&e>Hunger: <&f>25<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>30<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 467
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_ingredient_pastaitem|beef|custom_food_boiledegg|custom_crop_corn|carrot|custom_crop_cabbage|brown_mushroom/red_mushroom/custom_crop_whitemushroom|custom_food_oystersauce