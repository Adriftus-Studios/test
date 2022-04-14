custom_food_chocolateorange:
  type: item
  debug: false
  material: apple
  display name: <&a>Chocolate Orange
  data:
    amount: 7
    saturation: 8
  lore:
  - <&e>Hunger: <&f>7 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>8 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 540
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|custom_food_chocolatebar|custom_crop_orange