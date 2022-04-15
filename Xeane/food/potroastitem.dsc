custom_food_potroast:
  type: item
  debug: false
  material: apple
  display name: <&a>Pot Roast
  data:
    amount: 8
    saturation: 10
  lore:
  - <&e>Hunger: <&f>8<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>10<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1063
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|beef|potato|carrot