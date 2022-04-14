custom_food_potatoandleeksoup:
  type: item
  debug: false
  material: apple
  display name: <&a>Potato and Leek Soup
  data:
    amount: 14
    saturation: 17
  lore:
  - <&e>Hunger: <&f>14 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>17 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1056
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|potato|custom_crop_leek|custom_food_stock|custom_ingredient_creamitem|custom_crop_spiceleaf|custom_ingredient_blackpepperitem