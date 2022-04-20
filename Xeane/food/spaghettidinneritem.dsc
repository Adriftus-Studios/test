custom_food_spaghettidinner:
  type: item
  debug: false
  material: apple
  display name: <&a>Spagetti Dinner
  data:
    amount: 25
    saturation: 30
  lore:
  - <&e>Hunger: <&f>25<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>30<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1143
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_spagettiandmeatballs|custom_food_garlicbread|milk_bucket/custom_ingredient_freshmilkitem