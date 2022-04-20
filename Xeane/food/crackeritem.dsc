custom_food_cracker:
  type: item
  debug: false
  material: apple
  display name: <&a>Cracker
  data:
    amount: 5
    saturation: 6
  lore:
  - <&e>Hunger: <&f>5<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>6<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 320
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_ingredient_flouritem|custom_ingredient_saltitem