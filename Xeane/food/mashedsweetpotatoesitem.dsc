custom_food_mashedsweetpotatoes:
  type: item
  debug: false
  material: apple
  display name: <&a>Mashed Sweet Potatoes
  data:
    amount: 5
    saturation: 6
  lore:
  - <&e>Hunger: <&f>5 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>6 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 876
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|custom_crop_sweetpotato|custom_ingredient_butteritem