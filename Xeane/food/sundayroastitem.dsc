custom_food_sundayroast:
  type: item
  debug: false
  material: apple
  display name: <&a>Sunday Roast
  data:
    amount: 19
    saturation: 23
  lore:
  - <&e>Hunger: <&f>19<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>23<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1183
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_food_roastchicken|custom_food_roastpotatoes|custom_crop_avocado/custom_crop_olive