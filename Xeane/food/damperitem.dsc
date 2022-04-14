custom_food_damper:
  type: item
  debug: false
  material: apple
  display name: <&a>Damper
  data:
    amount: 10
    saturation: 12
  lore:
  - <&e>Hunger: <&f>10 <&font[adriftus:foods]><&chr[0000]>
  - <&e>Saturation: <&f>12 <&font[adriftus:foods]><&chr[0001]>
  recipes:
    1:
      type: shapeless
      input: custom_ingredient_bakewareitem|custom_ingredient_flouritem|milk_bucket/custom_ingredient_freshmilkitem|custom_ingredient_saltitem|custom_ingredient_butteritem