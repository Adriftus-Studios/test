custom_food_zucchinifries:
  type: item
  debug: false
  material: apple
  display name: <&a>Zucchini Fries
  data:
    amount: 15
    saturation: 18
  lore:
  - <&e>Hunger: <&f>15<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>18<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1245
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_crop_zucchini|custom_food_toast|custom_food_cheese|custom_crop_avocado/custom_crop_banana