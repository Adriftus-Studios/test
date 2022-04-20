custom_food_brownie:
  type: item
  debug: false
  material: apple
  display name: <&a>Brownie
  data:
    amount: 8
    saturation: 10
  lore:
  - <&e>Hunger: <&f>8<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>10<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 435
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_ingredient_cocoapowderitem|custom_ingredient_flouritem|custom_crop_avocado/custom_crop_banana|sugar