custom_food_gherkin:
  type: item
  debug: false
  material: apple
  display name: <&a>Gherkin
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>14<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 693
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_ingredient_vinegaritem|custom_ingredient_saltitem|custom_crop_spiceleaf|custom_crop_cucumber