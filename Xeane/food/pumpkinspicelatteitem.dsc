custom_food_pumpkinspicelatte:
  type: item
  debug: false
  material: apple
  display name: <&a>Pumpkin Spice Latte
  data:
    amount: 21
    saturation: 25
  lore:
  - <&e>Hunger: <&f>21 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>25 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1074
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|pumpkin|milk_bucket/custom_ingredient_freshmilkitem|custom_food_espresso|custom_ingredient_groundnutmegitem|custom_food_groundcinnamon