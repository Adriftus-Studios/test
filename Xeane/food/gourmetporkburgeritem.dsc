custom_food_gourmetporkburger:
  type: item
  debug: false
  material: apple
  display name: <&a>Gourmet Pork Burger
  data:
    amount: 42
    saturation: 50
  lore:
  - <&e>Hunger: <&f>42<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>50<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 713
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_food_gourmetporkpatty|custom_food_briochebun|custom_crop_tomato|custom_crop_cabbage/custom_crop_kale/custom_crop_lettuce/custom_crop_spinach|custom_crop_avocado|custom_food_friedonions|cooking_tool_grinder|cooking_tool_grinder