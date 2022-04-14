custom_food_fishlettucewrap:
  type: item
  debug: false
  material: apple
  display name: <&a>Fish Lettuce Wrap
  data:
    amount: 6
    saturation: 7
  lore:
  - <&e>Hunger: <&f>6 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>7 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 665
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_crop_lettuce|cod/salmon/tropical_fish