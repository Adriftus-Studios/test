custom_food_yogurt:
  type: item
  debug: false
  material: apple
  display name: <&a>Yogurt
  data:
    amount: 3
    saturation: 4
  lore:
  - <&e>Hunger: <&f>3 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>4 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 32
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|milk_bucket/custom_ingredient_freshmilkitem