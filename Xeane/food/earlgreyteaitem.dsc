custom_food_earlgreytea:
  type: item
  debug: false
  material: apple
  display name: <&a>Earl Grey Tea
  data:
    amount: 6
    saturation: 7
  lore:
  - <&e>Hunger: <&f>6 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>7 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 628
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_crop_tealeaf|custom_crop_orange|cooking_tool_grinder