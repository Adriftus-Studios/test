custom_ingredient_lemonjuice:
  type: item
  debug: false
  material: apple
  display name: <&a>Lemon Juice
  data:
    amount: 3
    saturation: 4
  lore:
  - <&e>Hunger: <&f>3 <&font[adriftus:foods]><&chr[0000]>
  - <&e>Saturation: <&f>4 <&font[adriftus:foods]><&chr[0001]>
  recipes:
    1:
      type: shapeless
      input: custom_ingredient_juicer|custom_food_lemon|custom_food_lemon