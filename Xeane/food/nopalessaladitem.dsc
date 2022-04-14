custom_food_nopalessalad:
  type: item
  debug: false
  material: apple
  display name: <&a>Nopales Salad
  data:
    amount: 14
    saturation: 17
  lore:
  - <&e>Hunger: <&f>14 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>17 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 923
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|cactus|custom_crop_onion|custom_crop_chilipepper|custom_crop_tomato|custom_crop_avocado|custom_crop_spiceleaf