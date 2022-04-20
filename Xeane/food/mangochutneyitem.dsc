custom_food_mangochutney:
  type: item
  debug: false
  material: apple
  display name: <&a>Mango Chutney
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>11<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 857
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_crop_mango|custom_crop_spiceleaf|custom_crop_mustardseeds|custom_ingredient_cookingoilitem