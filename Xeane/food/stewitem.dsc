custom_food_stew:
  type: item
  debug: false
  material: apple
  display name: <&a>Stew
  data:
    amount: 15
    saturation: 18
  lore:
  - <&e>Hunger: <&f>15 <&font[adriftus:foods]><&chr[0000]>
  - <&e>Saturation: <&f>18 <&font[adriftus:foods]><&chr[0001]>
  recipes:
    1:
      type: shapeless
      input: custom_ingredient_potitem|beef/chicken/cod/mutton/porkchop/rabbit/salmon/tropical_fish|custom_crop_avocado/custom_crop_olive|custom_crop_avocado/custom_crop_olive|custom_ingredient_flouritem