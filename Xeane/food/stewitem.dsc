custom_food_stew:
  type: item
  debug: false
  material: apple
  display name: <&a>Stew
  data:
    amount: 15
    saturation: 18
  lore:
  - <&e>Hunger: <&f>15<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>18<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1164
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|beef/chicken/cod/mutton/porkchop/rabbit/salmon/tropical_fish|custom_crop_avocado/custom_crop_olive|custom_crop_avocado/custom_crop_olive|custom_ingredient_flouritem