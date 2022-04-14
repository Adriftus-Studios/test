custom_food_jambalaya:
  type: item
  debug: false
  material: apple
  display name: <&a>Jambalaya
  data:
    amount: 24
    saturation: 29
  lore:
  - <&e>Hunger: <&f>24 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>29 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 797
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_food_stock|custom_food_sausage|chicken|custom_crop_onion|custom_crop_bellpepper|custom_crop_tomato|custom_crop_spiceleaf|custom_ingredient_blackpepperitem