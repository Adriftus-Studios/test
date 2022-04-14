custom_food_porklomein:
  type: item
  debug: false
  material: apple
  display name: <&a>Pork Lo Mein
  data:
    amount: 18
    saturation: 22
  lore:
  - <&e>Hunger: <&f>18 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>22 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1053
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|porkchop|custom_ingredient_pastaitem|custom_crop_onion|carrot|custom_crop_cabbage|custom_crop_garlic|custom_ingredient_soysauceitem