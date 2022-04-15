custom_food_beetburger:
  type: item
  debug: false
  material: apple
  display name: <&a>Beet Burger
  data:
    amount: 19
    saturation: 23
  lore:
  - <&e>Hunger: <&f>19<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>23<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 398
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|beef|beetroot|custom_food_friedegg|porkchop|custom_crop_pineapple|custom_food_toast