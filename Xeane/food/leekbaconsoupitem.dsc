custom_food_leekbaconsoup:
  type: item
  debug: false
  material: apple
  display name: <&a>Leek Bacon Soup
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>11<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 827
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_crop_leek|porkchop|potato|custom_ingredient_creamitem