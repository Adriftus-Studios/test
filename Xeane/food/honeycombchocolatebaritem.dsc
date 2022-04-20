custom_food_honeycombchocolatebar:
  type: item
  debug: false
  material: apple
  display name: <&a>Honeycomb Chocolate Bar
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>11<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 769
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|custom_food_chocolatebar|honey_bottle