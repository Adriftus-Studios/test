custom_food_bbqpotatochips:
  type: item
  debug: false
  material: apple
  display name: <&a>BBQ Potato Chips
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>11 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 391
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_food_bbqsauce|potato|custom_ingredient_cookingoilitem