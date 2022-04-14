custom_food_citrussalad:
  type: item
  debug: false
  material: apple
  display name: <&a>Citrus Salad
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>14<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 555
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_crop_grapefruit/custom_crop_lemon/custom_crop_lime|custom_crop_grapefruit/custom_crop_lemon/custom_crop_lime|custom_crop_cabbage/custom_crop_kale/custom_crop_lettuce/custom_crop_spinach