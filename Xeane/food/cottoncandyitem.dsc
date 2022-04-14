custom_food_cottoncandy:
  type: item
  debug: false
  material: apple
  display name: <&a>Cotton Candy
  data:
    amount: 2
    saturation: 2
  lore:
  - <&e>Hunger: <&f>2<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>2<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 573
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|sugar