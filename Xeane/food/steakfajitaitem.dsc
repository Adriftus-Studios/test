custom_food_steakfajita:
  type: item
  debug: false
  material: apple
  display name: <&a>Steak Fajita
  data:
    amount: 16
    saturation: 19
  lore:
  - <&e>Hunger: <&f>16 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>19 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1162
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|beef|custom_crop_onion|custom_crop_bellpepper|custom_crop_chilipepper|custom_crop_spiceleaf|custom_food_tortilla