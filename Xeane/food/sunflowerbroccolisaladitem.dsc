custom_food_sunflowerbroccolisalad:
  type: item
  debug: false
  material: apple
  display name: <&a>Sunflower Broccoli Salad
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>14<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1184
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_sunflowerseeds|custom_crop_broccoli|custom_ingredient_mayonaiseitem|sugar|porkchop