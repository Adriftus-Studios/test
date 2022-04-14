custom_food_groundbeef:
  type: item
  debug: false
  material: apple
  display name: <&a>Ground Beef
  data:
    amount: 4
    saturation: 5
  lore:
  - <&e>Hunger: <&f>4 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>5 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 44
  recipes:
    1:
      type: shapeless
      input: cooking_tool_grinder|beef