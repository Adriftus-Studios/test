custom_food_hamandcheesesandwich:
  type: item
  debug: false
  material: apple
  display name: <&a>Ham and Cheese Sandwich
  data:
    amount: 13
    saturation: 16
  lore:
  - <&e>Hunger: <&f>13 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>16 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 756
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|bread|porkchop|custom_food_cheese