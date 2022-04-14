custom_food_potatoskins:
  type: item
  debug: false
  material: apple
  display name: <&a>Potato Skins
  data:
    amount: 14
    saturation: 17
  lore:
  - <&e>Hunger: <&f>14<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>17<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1061
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|baked_potato|custom_food_cheese|custom_ingredient_creamitem|custom_crop_onion/custom_crop_scallion