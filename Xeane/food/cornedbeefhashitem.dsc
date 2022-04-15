custom_food_cornedbeefhash:
  type: item
  debug: false
  material: apple
  display name: <&a>Corned Beef Hash
  data:
    amount: 29
    saturation: 35
  lore:
  - <&e>Hunger: <&f>29<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>35<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 567
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_food_cornedbeef|custom_crop_onion|custom_crop_bellpepper|potato|custom_crop_avocado/custom_crop_banana|custom_ingredient_butteritem|custom_food_cheese