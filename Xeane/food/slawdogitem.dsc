custom_food_slawdog:
  type: item
  debug: false
  material: apple
  display name: <&a>Slawdog
  data:
    amount: 24
    saturation: 29
  lore:
  - <&e>Hunger: <&f>24 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>29 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1127
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_hotdog|custom_ingredient_ketchupitem|custom_crop_mustard|custom_ingredient_relishitem