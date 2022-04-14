custom_food_poutine:
  type: item
  debug: false
  material: apple
  display name: <&a>Poutine
  data:
    amount: 19
    saturation: 23
  lore:
  - <&e>Hunger: <&f>19 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>23 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1065
  recipes:
    1:
      type: shapeless
      input: cooking_tool_mixingbowl|custom_food_fries|custom_food_cheese|custom_food_gravy