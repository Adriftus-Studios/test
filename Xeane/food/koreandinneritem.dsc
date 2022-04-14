custom_food_koreandinner:
  type: item
  debug: false
  material: apple
  display name: <&a>Korean Dinner
  data:
    amount: 40
    saturation: 48
  lore:
  - <&e>Hunger: <&f>40 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>48 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 817
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_bulgogi|custom_food_omurice|custom_food_kimchi|custom_crop_cabbage/custom_crop_kale/custom_crop_lettuce/custom_crop_spinach