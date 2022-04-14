custom_food_toastedwestern:
  type: item
  debug: false
  material: apple
  display name: <&a>Toasted Western
  data:
    amount: 18
    saturation: 22
  lore:
  - <&e>Hunger: <&f>18 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>22 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1221
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|porkchop|custom_crop_bellpepper|custom_crop_onion|custom_crop_avocado/custom_crop_banana|custom_ingredient_butteritem|custom_food_toast