custom_food_kohlundpinkel:
  type: item
  debug: false
  material: apple
  display name: <&a>Kohl und Pinkel
  data:
    amount: 23
    saturation: 28
  lore:
  - <&e>Hunger: <&f>23 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>28 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 816
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|porkchop|custom_food_pinkel|potato|custom_ingredient_blackpepperitem|custom_crop_onion|custom_food_sausage|custom_crop_kale