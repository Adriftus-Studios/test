custom_food_honeyglazedcarrots:
  type: item
  debug: false
  material: apple
  display name: <&a>Honey Glazed Carrots
  data:
    amount: 14
    saturation: 17
  lore:
  - <&e>Hunger: <&f>14 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>17 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 770
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|carrot|honey_bottle|custom_ingredient_butteritem|custom_crop_lemon