custom_food_raspberryjuice:
  type: item
  debug: false
  material: apple
  display name: <&a>Raspberry Juice
  data:
    amount: 5
    saturation: 6
  lore:
  - <&e>Hunger: <&f>5<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>6<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1091
  recipes:
    1:
      type: shapeless
      input: cooking_tool_juicer|custom_crop_raspberry|custom_crop_raspberry