custom_food_pickledonions:
  type: item
  debug: false
  material: apple
  display name: <&a>Pickled Onions
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>11 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1016
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_crop_onion|custom_ingredient_saltitem|custom_ingredient_vinegaritem