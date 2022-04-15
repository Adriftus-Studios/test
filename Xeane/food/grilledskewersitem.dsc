custom_food_grilledskewers:
  type: item
  debug: false
  material: apple
  display name: <&a>Grilled Skewers
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>11<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 741
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_crop_bellpepper|custom_crop_onion|carrot|stick