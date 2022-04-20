custom_food_gourmetporkpatty:
  type: item
  debug: false
  material: apple
  display name: <&a>Gourmet Pork Patty
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>14<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 714
  recipes:
    1:
      type: shapeless
      input: cooking_tool_mixingbowl|custom_food_groundpork|custom_ingredient_saltandpepperitem|custom_crop_spiceleaf|custom_crop_mustardseeds