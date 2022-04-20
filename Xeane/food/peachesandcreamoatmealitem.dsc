custom_food_peachesandcreamoatmeal:
  type: item
  debug: false
  material: apple
  display name: <&a>Peaches and Cream Oatmeal
  data:
    amount: 10
    saturation: 12
  lore:
  - <&e>Hunger: <&f>10<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>12<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 979
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_crop_oats|custom_crop_peach|custom_ingredient_creamitem|water_bucket/custom_ingredient_freshwateritem