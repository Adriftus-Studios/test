custom_food_bakedbeans:
  type: item
  debug: false
  material: apple
  display name: <&a>Baked Beans
  data:
    amount: 10
    saturation: 12
  lore:
  - <&e>Hunger: <&f>10<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>12<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 366
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_crop_bean|porkchop|custom_food_bbqsauce