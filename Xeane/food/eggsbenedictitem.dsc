custom_food_eggsbenedict:
  type: item
  debug: false
  material: apple
  display name: <&a>Eggs Benedict
  data:
    amount: 17
    saturation: 20
  lore:
  - <&e>Hunger: <&f>17<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>20<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 634
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_crop_avocado/custom_crop_banana|custom_food_biscuit|porkchop|custom_ingredient_butteritem|custom_crop_lemon