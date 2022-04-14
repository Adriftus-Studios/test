custom_food_pho:
  type: item
  debug: false
  material: apple
  display name: <&a>Pho
  data:
    amount: 14
    saturation: 17
  lore:
  - <&e>Hunger: <&f>14 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>17 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1014
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_food_stock|custom_ingredient_pastaitem|custom_crop_spiceleaf|custom_food_groundcinnamon|custom_crop_onion