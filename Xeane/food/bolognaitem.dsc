custom_food_bologna:
  type: item
  debug: false
  material: apple
  display name: <&a>Bologna
  data:
    amount: 13
    saturation: 16
  lore:
  - <&e>Hunger: <&f>13 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>16 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 419
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_groundbeef|custom_food_groundpork|custom_crop_onion|custom_crop_garlic|sugar|custom_ingredient_saltitem