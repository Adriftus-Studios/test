custom_food_eggplantparm:
  type: item
  debug: false
  material: apple
  display name: <&a>Eggplant Parm
  data:
    amount: 15
    saturation: 18
  lore:
  - <&e>Hunger: <&f>15<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>18<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 631
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_crop_eggplant|custom_crop_tomato|custom_ingredient_pastaitem|custom_food_cheese