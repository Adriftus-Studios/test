custom_food_chorizo:
  type: item
  debug: false
  material: apple
  display name: <&a>Chorizo
  data:
    amount: 8
    saturation: 10
  lore:
  - <&e>Hunger: <&f>8<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>10<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 548
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|porkchop|custom_crop_spiceleaf|custom_crop_garlic|custom_ingredient_saltitem