custom_ingredient_limejuice:
  type: item
  debug: false
  material: apple
  display name: <&a>Lime Juice
  data:
    amount: 3
    saturation: 4
  lore:
  - <&e>Hunger: <&f>3 <&font[adriftus:foods]><&chr[0000]>
  - <&e>Saturation: <&f>4 <&font[adriftus:foods]><&chr[0001]>
  recipes:
    1:
      type: shapeless
      input: custom_ingredient_juicer|custom_food_lime|custom_food_lime