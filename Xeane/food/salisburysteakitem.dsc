custom_food_salisburysteak:
  type: item
  debug: false
  material: apple
  display name: <&a>Salisbury Steak
  data:
    amount: 10
    saturation: 12
  lore:
  - <&e>Hunger: <&f>10 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>12 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1113
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|beef|custom_ingredient_flouritem|custom_crop_avocado/custom_crop_banana|custom_ingredient_blackpepperitem