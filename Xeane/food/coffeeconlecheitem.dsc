custom_food_coffeeconleche:
  type: item
  debug: false
  material: apple
  display name: <&a>Coffee con Leche
  data:
    amount: 16
    saturation: 19
  lore:
  - <&e>Hunger: <&f>16<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>19<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 557
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_food_espresso|milk_bucket/custom_ingredient_freshmilkitem|custom_food_groundcinnamon