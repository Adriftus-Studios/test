custom_food_meringueroulade:
  type: item
  debug: false
  material: apple
  display name: <&a>Meringue Roulade
  data:
    amount: 18
    saturation: 22
  lore:
  - <&e>Hunger: <&f>18<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>22<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 889
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_meringue|custom_crop_strawberry|custom_food_strawberryjelly|custom_crop_mango