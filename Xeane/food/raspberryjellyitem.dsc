custom_food_raspberryjelly:
  type: item
  debug: false
  material: apple
  display name: <&a>Raspberry Jelly
  data:
    amount: 4
    saturation: 5
  lore:
  - <&e>Hunger: <&f>4<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>5<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 240
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|custom_crop_raspberry|sugar