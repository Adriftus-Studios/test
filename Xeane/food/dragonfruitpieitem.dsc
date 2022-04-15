custom_food_dragonfruitpie:
  type: item
  debug: false
  material: apple
  display name: <&a>Dragonfruit Pie
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>11<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 616
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_crop_dragonfruit|sugar|custom_ingredient_doughitem