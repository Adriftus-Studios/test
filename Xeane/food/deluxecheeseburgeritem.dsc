custom_food_deluxecheeseburger:
  type: item
  debug: false
  material: apple
  display name: <&a>Deluxe Cheeseburger
  data:
    amount: 24
    saturation: 29
  lore:
  - <&e>Hunger: <&f>24<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>29<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 606
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_food_groundbeef|custom_food_cheese|custom_crop_lettuce|custom_crop_onion|custom_ingredient_mayonaiseitem|bread