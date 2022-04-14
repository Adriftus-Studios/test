custom_food_teriyakichicken:
  type: item
  debug: false
  material: apple
  display name: <&a>Teriyaki Chicken
  data:
    amount: 15
    saturation: 18
  lore:
  - <&e>Hunger: <&f>15<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>18<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1214
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|chicken|custom_crop_rice|custom_ingredient_soysauceitem|honey_bottle|custom_crop_scallion|custom_ingredient_cookingoilitem