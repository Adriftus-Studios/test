custom_food_popcorn:
  type: item
  debug: false
  material: apple
  display name: <&a>Popcorn
  data:
    amount: 7
    saturation: 8
  lore:
  - <&e>Hunger: <&f>7 <&font[adriftus:foods]><&chr[0000]>
  - <&e>Saturation: <&f>8 <&font[adriftus:foods]><&chr[0001]>
  recipes:
    1:
      type: shapeless
      input: custom_ingredient_potitem|custom_ingredient_butteritem|custom_ingredient_saltitem|custom_crop_corn