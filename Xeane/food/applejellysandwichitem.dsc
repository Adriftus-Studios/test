custom_food_applejellysandwich:
  type: item
  debug: false
  material: apple
  display name: <&a>Apple Jelly Sandwich
  data:
    amount: 14
    saturation: 17
  lore:
  - <&e>Hunger: <&f>14<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>17<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 338
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_applejelly|bread|custom_food_almondbutter/custom_food_cashewbutter/custom_food_chestnutbutter/custom_food_hazelnutbutter/custom_food_peanutbutter/custom_food_pecanbutter/custom_food_pistachiobutter/custom_food_walnutbutter