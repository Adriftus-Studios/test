custom_food_mushroomlasagna:
  type: item
  debug: false
  material: apple
  display name: <&a>Mushroom Lasagna
  data:
    amount: 15
    saturation: 18
  lore:
  - <&e>Hunger: <&f>15<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>18<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 913
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_ingredient_pastaitem|custom_food_cheese|custom_crop_tomato|custom_crop_onion|custom_crop_garlic|brown_mushroom/red_mushroom/custom_crop_whitemushroom