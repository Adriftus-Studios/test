custom_food_sesameball:
  type: item
  debug: false
  material: apple
  display name: <&a>Sesame Ball
  data:
    amount: 8
    saturation: 10
  lore:
  - <&e>Hunger: <&f>8<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>10<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1123
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_crop_sesameseeds|custom_ingredient_cookingoilitem|custom_crop_bean|sugar|custom_ingredient_flouritem