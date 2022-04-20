custom_food_peanutchocolatebar:
  type: item
  debug: false
  material: apple
  display name: <&a>Peanut Butter Chocolate Bar
  data:
    amount: 6
    saturation: 7
  lore:
  - <&e>Hunger: <&f>6<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>7<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 991
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|custom_food_chocolatebar|custom_crop_peanut|custom_ingredient_cookingoilitem