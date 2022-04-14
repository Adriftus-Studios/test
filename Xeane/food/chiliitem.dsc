custom_food_chili:
  type: item
  debug: false
  material: apple
  display name: <&a>Chili
  data:
    amount: 13
    saturation: 16
  lore:
  - <&e>Hunger: <&f>13 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>16 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 523
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|beef/chicken/cod/mutton/porkchop/rabbit/salmon/tropical_fish|custom_crop_chilipepper|custom_crop_tomato|custom_crop_onion/custom_crop_scallion|custom_crop_spiceleaf|custom_crop_bean