custom_food_sweetandsourchicken:
  type: item
  debug: false
  material: apple
  display name: <&a>Sweet and Sour Chicken
  data:
    amount: 26
    saturation: 31
  lore:
  - <&e>Hunger: <&f>26<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>31<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1191
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|chicken|custom_ingredient_flouritem|custom_crop_pineapple|custom_crop_bellpepper|custom_crop_onion|custom_ingredient_sweetandsoursauceitem