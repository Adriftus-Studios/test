custom_food_meatloafsandwich:
  type: item
  debug: false
  material: apple
  display name: <&a>Meatloaf Sandwich
  data:
    amount: 22
    saturation: 26
  lore:
  - <&e>Hunger: <&f>22 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>26 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 880
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_meatloaf|bread|custom_ingredient_ketchupitem