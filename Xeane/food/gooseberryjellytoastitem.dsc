custom_food_gooseberryjellytoast:
  type: item
  debug: false
  material: apple
  display name: <&a>Gooseberry Jelly Toast
  data:
    amount: 10
    saturation: 12
  lore:
  - <&e>Hunger: <&f>10 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>12 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 703
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_gooseberryjelly|custom_food_toast