custom_food_potatosalad:
  type: item
  debug: false
  material: apple
  display name: <&a>Potato Salad
  data:
    amount: 11
    saturation: 13
  lore:
  - <&e>Hunger: <&f>11 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>13 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1060
  recipes:
    1:
      type: shapeless
      input: cooking_tool_mixingbowl|potato|custom_ingredient_mayonaiseitem|custom_crop_mustard|custom_crop_spiceleaf|custom_crop_avocado/custom_crop_banana|custom_crop_onion/custom_crop_scallion