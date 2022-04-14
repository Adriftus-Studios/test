custom_food_spicymustardpork:
  type: item
  debug: false
  material: apple
  display name: <&a>Spicy Mustard Pork
  data:
    amount: 7
    saturation: 8
  lore:
  - <&e>Hunger: <&f>7 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>8 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1146
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|custom_crop_mustard|porkchop|custom_crop_garlic