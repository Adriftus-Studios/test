custom_food_toadinthehole:
  type: item
  debug: false
  material: apple
  display name: <&a>Toad in the Hole
  data:
    amount: 21
    saturation: 25
  lore:
  - <&e>Hunger: <&f>21<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>25<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1220
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_food_yorkshirepudding|custom_food_sausage