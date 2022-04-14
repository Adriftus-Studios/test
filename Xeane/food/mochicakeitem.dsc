custom_food_mochicake:
  type: item
  debug: false
  material: apple
  display name: <&a>Mochi Cake
  data:
    amount: 17
    saturation: 20
  lore:
  - <&e>Hunger: <&f>17 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>20 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 899
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_ingredient_butteritem|custom_food_mochi|custom_ingredient_flouritem|custom_crop_avocado/custom_crop_banana|custom_ingredient_vanillaitem|milk_bucket/custom_ingredient_freshmilkitem|cooking_tool_grinder|cooking_tool_grinder