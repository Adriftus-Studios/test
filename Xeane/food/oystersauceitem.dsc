custom_food_oystersauce:
  type: item
  debug: false
  material: apple
  display name: <&a>Oyster Sauce
  data:
    amount: 4
    saturation: 9
  lore:
  - <&e>Hunger: <&f>4<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>9<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 149
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|cod/salmon/tropical_fish|sugar|custom_ingredient_saltitem