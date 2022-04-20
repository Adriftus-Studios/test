custom_food_vindaloo:
  type: item
  debug: false
  material: apple
  display name: <&a>Vindaloo
  data:
    amount: 15
    saturation: 18
  lore:
  - <&e>Hunger: <&f>15<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>18<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1235
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|beef/chicken/cod/mutton/porkchop/rabbit/salmon/tropical_fish|custom_ingredient_currypowderitem|custom_ingredient_butteritem|custom_ingredient_blackpepperitem|custom_crop_onion