custom_food_pineapplejellysandwich:
  type: item
  debug: false
  material: apple
  display name: <&a>Pineapple Jelly Sandwich
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>14<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1020
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_pineapplejelly|bread|custom_food_almondbutter/custom_food_cashewbutter/custom_food_chestnutbutter/custom_food_hazelnutbutter/custom_food_peanutbutter/custom_food_pecanbutter/custom_food_pistachiobutter/custom_food_walnutbutter