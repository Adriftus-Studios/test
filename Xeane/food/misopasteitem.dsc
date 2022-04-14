custom_food_misopaste:
  type: item
  debug: false
  material: apple
  display name: <&a>Miso Paste
  data:
    amount: 6
    saturation: 7
  lore:
  - <&e>Hunger: <&f>6 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>7 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 894
  recipes:
    1:
      type: shapeless
      input: cooking_tool_grinder|custom_crop_soybean|brown_mushroom/red_mushroom/custom_crop_whitemushroom|custom_crop_rice|custom_ingredient_saltitem