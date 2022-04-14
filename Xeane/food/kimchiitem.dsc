custom_food_kimchi:
  type: item
  debug: false
  material: apple
  display name: <&a>Kimchi
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>14 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 809
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_ingredient_saltitem|custom_crop_cabbage|custom_crop_garlic|custom_crop_ginger|custom_crop_radish|custom_crop_scallion|custom_crop_spiceleaf|custom_crop_sesameseeds