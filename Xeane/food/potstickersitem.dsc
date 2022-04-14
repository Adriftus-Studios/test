custom_food_potstickers:
  type: item
  debug: false
  material: apple
  display name: <&a>Pot Stickers
  data:
    amount: 13
    saturation: 16
  lore:
  - <&e>Hunger: <&f>13 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>16 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1064
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|porkchop|custom_crop_cabbage|custom_crop_scallion|custom_ingredient_cookingoilitem|custom_ingredient_soysauceitem|custom_crop_garlic