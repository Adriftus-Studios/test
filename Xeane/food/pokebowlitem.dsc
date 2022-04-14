custom_food_pokebowl:
  type: item
  debug: false
  material: apple
  display name: <&a>Poke Bowl
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>11 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1042
  recipes:
    1:
      type: shapeless
      input: cooking_tool_mixingbowl|cod/salmon/tropical_fish|custom_crop_rice|custom_crop_soybean|custom_crop_ginger|custom_crop_scallion|custom_ingredient_soysauceitem