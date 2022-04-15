custom_food_misosoup:
  type: item
  debug: false
  material: apple
  display name: <&a>Miso
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>14<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 895
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_food_firmtofu|water_bucket/custom_ingredient_freshwateritem|custom_crop_scallion|custom_food_taiyaki