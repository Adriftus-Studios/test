custom_food_gingersnaps:
  type: item
  debug: false
  material: apple
  display name: <&a>Ginger Snaps
  data:
    amount: 5
    saturation: 6
  lore:
  - <&e>Hunger: <&f>5 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>6 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 696
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_crop_ginger|custom_ingredient_flouritem|sugar