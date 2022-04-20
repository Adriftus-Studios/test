custom_food_chickenalfredo:
  type: item
  debug: false
  material: apple
  display name: <&a>Chicken Alfredo
  data:
    amount: 11
    saturation: 13
  lore:
  - <&e>Hunger: <&f>11<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>13<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 503
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|chicken|custom_ingredient_creamitem|custom_crop_spiceleaf|custom_ingredient_pastaitem