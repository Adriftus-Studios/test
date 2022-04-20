custom_food_molasseschicken:
  type: item
  debug: false
  material: apple
  display name: <&a>Molasses Chicken
  data:
    amount: 8
    saturation: 10
  lore:
  - <&e>Hunger: <&f>8<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>10<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 902
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|chicken|sugar|custom_crop_garlic|custom_crop_onion|custom_ingredient_soysauceitem