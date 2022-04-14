custom_food_cottagepie:
  type: item
  debug: false
  material: apple
  display name: <&a>Cottage Pie
  data:
    amount: 15
    saturation: 18
  lore:
  - <&e>Hunger: <&f>15<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>18<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 572
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_food_groundbeef|potato|carrot|custom_ingredient_doughitem|custom_crop_peas