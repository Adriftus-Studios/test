custom_food_cracklins:
  type: item
  debug: false
  material: apple
  display name: <&a>Cracklins
  data:
    amount: 7
    saturation: 8
  lore:
  - <&e>Hunger: <&f>7<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>8<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 576
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|porkchop|custom_ingredient_cookingoilitem|custom_crop_spiceleaf