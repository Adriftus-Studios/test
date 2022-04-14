custom_food_leafyfishsandwich:
  type: item
  debug: false
  material: apple
  display name: <&a>Leafy Fish Sandwich
  data:
    amount: 16
    saturation: 19
  lore:
  - <&e>Hunger: <&f>16 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>19 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 826
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_ingredient_basicfishsandwhichitem|custom_crop_cabbage/custom_crop_kale/custom_crop_lettuce/custom_crop_spinach