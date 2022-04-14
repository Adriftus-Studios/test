custom_food_lycheejellytoast:
  type: item
  debug: false
  material: apple
  display name: <&a>Lychee Jelly Toast
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>14<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 850
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_lycheejelly|custom_food_toast