custom_food_bangersandmash:
  type: item
  debug: false
  material: apple
  display name: <&a>Bangers and Mash
  data:
    amount: 18
    saturation: 22
  lore:
  - <&e>Hunger: <&f>18 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>22 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 381
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_food_sausage|custom_ingredient_mashedpotatoes