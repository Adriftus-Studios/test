custom_food_charsiu:
  type: item
  debug: false
  material: apple
  display name: <&a>Charsiu
  data:
    amount: 30
    saturation: 36
  lore:
  - <&e>Hunger: <&f>30 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>36 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 485
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|porkchop|custom_ingredient_hoisinsauceitem|custom_ingredient_fivespiceitem|honey_bottle|custom_ingredient_soysauceitem