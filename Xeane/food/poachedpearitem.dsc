custom_food_poachedpear:
  type: item
  debug: false
  material: apple
  display name: <&a>Poached Pear
  data:
    amount: 8
    saturation: 10
  lore:
  - <&e>Hunger: <&f>8<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>10<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1041
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|custom_crop_pear|custom_ingredient_vanillaitem|sugar