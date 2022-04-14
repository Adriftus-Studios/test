custom_food_spagettiandmeatballs:
  type: item
  debug: false
  material: apple
  display name: <&a>Spagetti and Meatballs
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>14 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1141
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|custom_crop_tomato|custom_ingredient_pastaitem|custom_crop_spiceleaf|beef