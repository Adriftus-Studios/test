custom_food_meatystirfry:
  type: item
  debug: false
  material: apple
  display name: <&a>Meaty Stirfry
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>14 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 882
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_crop_bellpepper|carrot|custom_crop_rice|custom_crop_onion|beef/chicken/cod/mutton/porkchop/rabbit/salmon/tropical_fish