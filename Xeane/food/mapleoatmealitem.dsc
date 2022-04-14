custom_food_mapleoatmeal:
  type: item
  debug: false
  material: apple
  display name: <&a>Maple Oatmeal
  data:
    amount: 4
    saturation: 5
  lore:
  - <&e>Hunger: <&f>4 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>5 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 867
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_crop_oats|custom_crop_maplesyrup|water_bucket/custom_ingredient_freshwateritem