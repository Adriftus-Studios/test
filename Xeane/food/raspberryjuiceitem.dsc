custom_ingredient_raspberryjuice:
  type: item
  debug: false
  material: apple
  display name: <&a>Raspberry Juice
  data:
    amount: 5
    saturation: 6
  lore:
  - <&e>Hunger: <&f>5 <&font[adriftus:foods]><&chr[0000]>
  - <&e>Saturation: <&f>6 <&font[adriftus:foods]><&chr[0001]>
  recipes:
    1:
      type: shapeless
      input: custom_ingredient_juicer|custom_food_raspberry|custom_food_raspberry