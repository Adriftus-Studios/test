custom_food_deviledegg:
  type: item
  debug: false
  material: apple
  display name: <&a>Deviled Egg
  data:
    amount: 15
    saturation: 18
  lore:
  - <&e>Hunger: <&f>15 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>18 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 609
  recipes:
    1:
      type: shapeless
      input: cooking_tool_mixingbowl|custom_food_boiledegg|custom_ingredient_mayonaiseitem|custom_crop_mustard|custom_crop_spiceleaf|custom_ingredient_saltandpepperitem