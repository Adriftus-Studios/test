custom_food_mettbrotchen:
  type: item
  debug: false
  material: apple
  display name: <&a>Mettbrotchen
  data:
    amount: 15
    saturation: 18
  lore:
  - <&e>Hunger: <&f>15<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>18<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 891
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|porkchop|bread|custom_crop_onion|custom_ingredient_saltandpepperitem