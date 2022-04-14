custom_food_pumpkinmuffin:
  type: item
  debug: false
  material: apple
  display name: <&a>Pumpkin Muffin
  data:
    amount: 3
    saturation: 4
  lore:
  - <&e>Hunger: <&f>3 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>4 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1071
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|pumpkin|custom_ingredient_batteritem