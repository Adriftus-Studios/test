custom_food_ploughmanslunch:
  type: item
  debug: false
  material: apple
  display name: <&a>Ploughman's Lunch
  data:
    amount: 31
    saturation: 37
  lore:
  - <&e>Hunger: <&f>31 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>37 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1033
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|bread|apple|custom_food_cheese|custom_food_sweetpickle|custom_crop_onion|porkchop|custom_food_boiledegg