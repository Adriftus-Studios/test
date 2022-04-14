custom_food_cornedbeef:
  type: item
  debug: false
  material: apple
  display name: <&a>Corned Beef
  data:
    amount: 14
    saturation: 17
  lore:
  - <&e>Hunger: <&f>14 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>17 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 568
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|beef|custom_ingredient_saltitem|sugar|custom_food_groundcinnamon|custom_crop_mustardseeds|custom_ingredient_blackpepperitem|custom_crop_spiceleaf|custom_crop_ginger