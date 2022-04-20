custom_food_chilidog:
  type: item
  debug: false
  material: apple
  display name: <&a>Chili Dog
  data:
    amount: 27
    saturation: 32
  lore:
  - <&e>Hunger: <&f>27<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>32<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 522
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_food_hotdog|custom_food_chili