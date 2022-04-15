custom_food_hotchocolate:
  type: item
  debug: false
  material: apple
  display name: <&a>Hot Chocolate
  data:
    amount: 7
    saturation: 8
  lore:
  - <&e>Hunger: <&f>7<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>8<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 775
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|milk_bucket/custom_ingredient_freshmilkitem|custom_ingredient_cocoapowderitem|custom_food_marshmellows