custom_food_lambkebab:
  type: item
  debug: false
  material: apple
  display name: <&a>Lamb Kebab
  data:
    amount: 8
    saturation: 10
  lore:
  - <&e>Hunger: <&f>8 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>10 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 820
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|mutton|custom_crop_onion|custom_crop_bellpepper|stick