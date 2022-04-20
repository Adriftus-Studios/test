custom_food_hash:
  type: item
  debug: false
  material: apple
  display name: <&a>Hash
  data:
    amount: 11
    saturation: 13
  lore:
  - <&e>Hunger: <&f>11<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>13<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 759
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_crop_onion|custom_food_groundpork|potato|custom_ingredient_ketchupitem