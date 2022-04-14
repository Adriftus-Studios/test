custom_food_lambbarleysoup:
  type: item
  debug: false
  material: apple
  display name: <&a>Lamb Barley Soup
  data:
    amount: 13
    saturation: 16
  lore:
  - <&e>Hunger: <&f>13 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>16 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 819
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_food_stock|mutton|custom_crop_onion|carrot|custom_crop_barley