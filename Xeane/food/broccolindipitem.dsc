custom_food_broccolindip:
  type: item
  debug: false
  material: apple
  display name: <&a>Broccoli and Dip
  data:
    amount: 8
    saturation: 10
  lore:
  - <&e>Hunger: <&f>8<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>10<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 434
  recipes:
    1:
      type: shapeless
      input: cooking_tool_mixingbowl|custom_crop_broccoli|custom_crop_onion|custom_ingredient_creamitem