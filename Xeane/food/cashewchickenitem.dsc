custom_food_cashewchicken:
  type: item
  debug: false
  material: apple
  display name: <&a>Cashew Chicken
  data:
    amount: 8
    saturation: 10
  lore:
  - <&e>Hunger: <&f>8<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>10<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 479
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|chicken|custom_crop_cashew|custom_crop_rice|custom_crop_bellpepper/custom_crop_chilipepper