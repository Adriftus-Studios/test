custom_food_southernstylebreakfast:
  type: item
  debug: false
  material: apple
  display name: <&a>Southern Style Breakfast
  data:
    amount: 22
    saturation: 26
  lore:
  - <&e>Hunger: <&f>22<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>26<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1139
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_grits|custom_food_biscuit|porkchop|custom_crop_avocado/custom_crop_banana