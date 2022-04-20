custom_food_gourmetmuttonburger:
  type: item
  debug: false
  material: apple
  display name: <&a>Gourmet Mutton Burger
  data:
    amount: 40
    saturation: 48
  lore:
  - <&e>Hunger: <&f>40<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>48<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 711
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_food_gourmetmuttonpatty|custom_food_briochebun|custom_crop_spiceleaf|custom_food_cheese|custom_crop_tomato|custom_crop_spinach|custom_ingredient_roastedmushroomitem