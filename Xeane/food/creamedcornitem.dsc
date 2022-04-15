custom_food_creamedcorn:
  type: item
  debug: false
  material: apple
  display name: <&a>Creamed Corn
  data:
    amount: 6
    saturation: 7
  lore:
  - <&e>Hunger: <&f>6<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>7<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 585
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|custom_crop_corn|custom_crop_onion|custom_ingredient_creamitem