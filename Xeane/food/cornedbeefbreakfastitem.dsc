custom_food_cornedbeefbreakfast:
  type: item
  debug: false
  material: apple
  display name: <&a>Corned Beef Breakfast
  data:
    amount: 44
    saturation: 53
  lore:
  - <&e>Hunger: <&f>44 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>53 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 566
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_food_cornedbeefhash|custom_food_friedegg|custom_food_toast|custom_ingredient_ketchupitem|milk_bucket/custom_ingredient_freshmilkitem