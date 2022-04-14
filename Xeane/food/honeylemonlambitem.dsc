custom_food_honeylemonlamb:
  type: item
  debug: false
  material: apple
  display name: <&a>Honey Lemon Lamb
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>14 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 771
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|mutton|custom_crop_lemon|custom_crop_mustard|honey_bottle