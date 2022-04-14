custom_food_potatoesobrien:
  type: item
  debug: false
  material: apple
  display name: <&a>Potatoes O'Brien
  data:
    amount: 8
    saturation: 10
  lore:
  - <&e>Hunger: <&f>8 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>10 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1059
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|potato|custom_crop_onion|custom_crop_bellpepper|custom_ingredient_cookingoilitem