custom_food_chickendinner:
  type: item
  debug: false
  material: apple
  display name: <&a>Chicken Dinner
  data:
    amount: 19
    saturation: 23
  lore:
  - <&e>Hunger: <&f>19<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>23<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 510
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_friedchicken|custom_food_mashedpotatoes|custom_crop_avocado/custom_crop_olive