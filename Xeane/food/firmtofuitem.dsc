custom_food_firmtofu:
  type: item
  debug: false
  material: apple
  display name: <&a>Firm Tofu
  data:
    amount: 3
    saturation: 4
  lore:
  - <&e>Hunger: <&f>3 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>4 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 225
  recipes:
    1:
      type: shapeless
      input: cooking_tool_roller|custom_food_silkentofu