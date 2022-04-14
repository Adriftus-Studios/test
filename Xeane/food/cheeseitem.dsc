custom_food_cheese:
  type: item
  debug: false
  material: apple
  display name: <&a>Cheese
  data:
    amount: 4
    saturation: 5
  lore:
  - <&e>Hunger: <&f>4<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>5<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 11
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|milk_bucket/custom_ingredient_freshmilkitem|custom_ingredient_saltitem