custom_food_apricotglazedpork:
  type: item
  debug: false
  material: apple
  display name: <&a>Apricot Glazed Pork
  data:
    amount: 10
    saturation: 12
  lore:
  - <&e>Hunger: <&f>10 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>12 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 346
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|porkchop|custom_food_apricotjelly