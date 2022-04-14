custom_food_ceviche:
  type: item
  debug: false
  material: apple
  display name: <&a>Ceviche
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>11 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 483
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|cod/salmon/tropical_fish|custom_ingredient_saltitem|custom_crop_lemon|custom_crop_onion|custom_crop_sweetpotato|custom_crop_spiceleaf