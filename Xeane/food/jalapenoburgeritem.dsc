custom_food_jalapenoburger:
  type: item
  debug: false
  material: apple
  display name: <&a>Jalapeno Burger
  data:
    amount: 17
    saturation: 20
  lore:
  - <&e>Hunger: <&f>17<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>20<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 796
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_basichamburger|custom_crop_chilipepper