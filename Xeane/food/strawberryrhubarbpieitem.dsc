custom_food_strawberryrhubarbpie:
  type: item
  debug: false
  material: apple
  display name: <&a>Strawberry Rhubarb
  data:
    amount: 8
    saturation: 10
  lore:
  - <&e>Hunger: <&f>8<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>10<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1169
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_ingredient_doughitem|sugar|custom_crop_strawberry|custom_crop_rhubarb