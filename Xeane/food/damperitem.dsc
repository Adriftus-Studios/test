custom_food_damper:
  type: item
  debug: false
  material: apple
  display name: <&a>Damper
  data:
    amount: 10
    saturation: 12
  lore:
  - <&e>Hunger: <&f>10 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>12 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 595
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_ingredient_flouritem|milk_bucket/custom_ingredient_freshmilkitem|custom_ingredient_saltitem|custom_ingredient_butteritem