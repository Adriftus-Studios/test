custom_food_pomegranatejellytoast:
  type: item
  debug: false
  material: apple
  display name: <&a>Pomegranate Jelly Toast
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>14<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1044
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_pomegranatejelly|custom_food_toast