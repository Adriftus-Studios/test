custom_food_figjellysandwich:
  type: item
  debug: false
  material: apple
  display name: <&a>Fig Jelly Sandwich
  data:
    amount: 14
    saturation: 17
  lore:
  - <&e>Hunger: <&f>14 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>17 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 653
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_figjelly|bread|custom_food_almondbutter/custom_food_cashewbutter/custom_food_chestnutbutter/custom_food_hazelnutbutter/custom_food_peanutbutter/custom_food_pecanbutter/custom_food_pistachiobutter/custom_food_walnutbutter