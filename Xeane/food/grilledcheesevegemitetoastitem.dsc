custom_food_grilledcheesevegemitetoast:
  type: item
  debug: false
  material: apple
  display name: <&a>Grilled Cheese Vegemite Toast
  data:
    amount: 20
    saturation: 24
  lore:
  - <&e>Hunger: <&f>20 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>24 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 740
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_grilledcheese|custom_food_vegemite