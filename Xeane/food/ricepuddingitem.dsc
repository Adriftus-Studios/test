custom_food_ricepudding:
  type: item
  debug: false
  material: apple
  display name: <&a>Rice Pudding
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>11<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1105
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|custom_crop_rice|milk_bucket/custom_ingredient_freshmilkitem|sugar|custom_food_groundcinnamon|custom_ingredient_vanillaitem