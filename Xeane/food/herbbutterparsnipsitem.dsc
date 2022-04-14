custom_food_herbbutterparsnips:
  type: item
  debug: false
  material: apple
  display name: <&a>Herb Butter Parsnips
  data:
    amount: 6
    saturation: 7
  lore:
  - <&e>Hunger: <&f>6 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>7 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 764
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|custom_crop_parsnip|custom_ingredient_butteritem|custom_crop_spiceleaf