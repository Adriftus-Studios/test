custom_food_rivermudcake:
  type: item
  debug: false
  material: apple
  display name: <&a>Rive Mud Cake
  data:
    amount: 16
    saturation: 19
  lore:
  - <&e>Hunger: <&f>16<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>19<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1106
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_ingredient_cocoapowderitem|custom_crop_coconut|custom_food_marshmellows|custom_ingredient_flouritem|custom_crop_avocado/custom_crop_banana|custom_ingredient_butteritem