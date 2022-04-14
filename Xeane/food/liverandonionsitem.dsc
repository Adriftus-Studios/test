custom_food_liverandonions:
  type: item
  debug: false
  material: apple
  display name: <&a>Liver and Onions
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>11 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 846
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|rotten_flesh|custom_crop_onion|custom_crop_avocado/custom_crop_olive