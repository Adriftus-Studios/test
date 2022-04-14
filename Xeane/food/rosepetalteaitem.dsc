custom_food_rosepetaltea:
  type: item
  debug: false
  material: apple
  display name: <&a>Rose Petal Tea
  data:
    amount: 4
    saturation: 5
  lore:
  - <&e>Hunger: <&f>4 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>5 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1111
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_crop_tealeaf|rose_bush