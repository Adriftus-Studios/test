custom_food_onionhamburger:
  type: item
  debug: false
  material: apple
  display name: <&a>Onion Hamburger
  data:
    amount: 19
    saturation: 23
  lore:
  - <&e>Hunger: <&f>19 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>23 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 934
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_basichamburger|custom_food_friedonions