custom_food_pepperstirfry:
  type: item
  debug: false
  material: apple
  display name: <&a>Pepper Stir Fry
  data:
    amount: 10
    saturation: 12
  lore:
  - <&e>Hunger: <&f>10 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>12 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1006
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_crop_bellpepper|custom_crop_chilipepper|custom_crop_garlic|custom_ingredient_soysauceitem