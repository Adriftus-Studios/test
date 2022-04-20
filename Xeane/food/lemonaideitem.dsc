custom_food_lemonaide:
  type: item
  debug: false
  material: apple
  display name: <&a>Lemonaide
  data:
    amount: 4
    saturation: 5
  lore:
  - <&e>Hunger: <&f>4<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>5<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 828
  recipes:
    1:
      type: shapeless
      input: cooking_tool_mixingbowl|custom_crop_lemon|custom_crop_lemon|sugar