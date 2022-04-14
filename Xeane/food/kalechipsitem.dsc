custom_food_kalechips:
  type: item
  debug: false
  material: apple
  display name: <&a>Kale Chips
  data:
    amount: 4
    saturation: 5
  lore:
  - <&e>Hunger: <&f>4<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>5<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 807
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_crop_kale