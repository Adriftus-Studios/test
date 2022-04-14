custom_food_smores:
  type: item
  debug: false
  material: apple
  display name: <&a>Smores
  data:
    amount: 10
    saturation: 12
  lore:
  - <&e>Hunger: <&f>10 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>12 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1128
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_food_cracker|custom_food_marshmellows|custom_food_chocolatebar