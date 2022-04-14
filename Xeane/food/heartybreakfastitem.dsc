custom_food_heartybreakfast:
  type: item
  debug: false
  material: apple
  display name: <&a>Hearty Breakfast
  data:
    amount: 24
    saturation: 29
  lore:
  - <&e>Hunger: <&f>24 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>29 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 763
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|porkchop|custom_food_boiledegg|custom_food_toast|custom_food_potatocakes|custom_food_chocolatemilk