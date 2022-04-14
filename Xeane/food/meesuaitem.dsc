custom_food_meesua:
  type: item
  debug: false
  material: apple
  display name: <&a>Meesua
  data:
    amount: 23
    saturation: 28
  lore:
  - <&e>Hunger: <&f>23 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>28 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 883
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_ingredient_pastaitem|porkchop|custom_crop_corn|carrot|custom_crop_scallion|custom_food_oystersauce|custom_crop_coconut