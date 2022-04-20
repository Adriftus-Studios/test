custom_food_dango:
  type: item
  debug: false
  material: apple
  display name: <&a>Dango
  data:
    amount: 17
    saturation: 20
  lore:
  - <&e>Hunger: <&f>17<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>20<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 597
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_mochi|custom_food_mochi|custom_food_mochi|stick