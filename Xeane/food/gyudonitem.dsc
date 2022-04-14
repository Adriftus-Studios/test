custom_food_gyudon:
  type: item
  debug: false
  material: apple
  display name: <&a>Gyudon
  data:
    amount: 8
    saturation: 10
  lore:
  - <&e>Hunger: <&f>8 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>10 <&chr[0001].font[adriftus:foods]>
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|beef|custom_crop_onion|custom_crop_scallion|custom_crop_ginger|custom_crop_rice