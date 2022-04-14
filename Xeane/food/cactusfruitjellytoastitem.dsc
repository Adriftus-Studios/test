custom_food_cactusfruitjellytoast:
  type: item
  debug: false
  material: apple
  display name: <&a>Cactus Fruit Jelly Toast
  data:
    amount: 10
    saturation: 12
  lore:
  - <&e>Hunger: <&f>10 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>12 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 440
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_cactusfruitjelly|custom_food_toast