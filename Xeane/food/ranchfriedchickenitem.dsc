custom_food_ranchfriedchicken:
  type: item
  debug: false
  material: apple
  display name: <&a>Ranch Fried Chicken
  data:
    amount: 13
    saturation: 16
  lore:
  - <&e>Hunger: <&f>13<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>16<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1088
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|chicken|custom_ingredient_cookingoilitem|custom_ingredient_batteritem|custom_ingredient_creamitem|custom_crop_spiceleaf