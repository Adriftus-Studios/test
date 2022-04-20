custom_food_footlong:
  type: item
  debug: false
  material: apple
  display name: <&a>Footlong
  data:
    amount: 18
    saturation: 22
  lore:
  - <&e>Hunger: <&f>18<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>22<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 669
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|bread|porkchop|custom_crop_cabbage/custom_crop_kale/custom_crop_lettuce/custom_crop_spinach|custom_crop_tomato|custom_ingredient_mayonaiseitem