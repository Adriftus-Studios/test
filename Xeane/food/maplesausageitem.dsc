custom_food_maplesausage:
  type: item
  debug: false
  material: apple
  display name: <&a>Maple Sausage
  data:
    amount: 6
    saturation: 7
  lore:
  - <&e>Hunger: <&f>6 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>7 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 868
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|beef/chicken/cod/mutton/porkchop/rabbit/salmon/tropical_fish|custom_crop_spiceleaf|custom_crop_maplesyrup