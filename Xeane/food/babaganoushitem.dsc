custom_food_babaganoush:
  type: item
  debug: false
  material: apple
  display name: <&a>Babaganoush
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>11<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 358
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_crop_eggplant|custom_crop_garlic|custom_crop_lemon|custom_ingredient_cookingoilitem|custom_crop_spiceleaf