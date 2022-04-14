custom_food_cornedbeefandcabbage:
  type: item
  debug: false
  material: apple
  display name: <&a>Corned Beef and Cabbage
  data:
    amount: 18
    saturation: 22
  lore:
  - <&e>Hunger: <&f>18<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>22<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 565
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_food_cornedbeef|custom_crop_cabbage