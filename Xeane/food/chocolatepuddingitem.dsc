custom_food_chocolatepudding:
  type: item
  debug: false
  material: apple
  display name: <&a>Chocolate Pudding
  data:
    amount: 5
    saturation: 6
  lore:
  - <&e>Hunger: <&f>5<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>6<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 542
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|custom_ingredient_cocoapowderitem|milk_bucket/custom_ingredient_freshmilkitem