custom_food_cherryjelly:
  type: item
  debug: false
  material: apple
  display name: <&a>Cherry Jelly
  data:
    amount: 6
    saturation: 7
  lore:
  - <&e>Hunger: <&f>6<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>7<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 156
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|custom_crop_cherry|sugar