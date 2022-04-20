custom_food_baconwrappeddates:
  type: item
  debug: false
  material: apple
  display name: <&a>Bacon Wrapped Dates
  data:
    amount: 8
    saturation: 10
  lore:
  - <&e>Hunger: <&f>8<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>10<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 364
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_crop_date|porkchop