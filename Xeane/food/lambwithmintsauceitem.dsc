custom_food_lambwithmintsauce:
  type: item
  debug: false
  material: apple
  display name: <&a>Lamb with Mint Sauce
  data:
    amount: 10
    saturation: 12
  lore:
  - <&e>Hunger: <&f>10<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>12<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 821
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|mutton|custom_crop_spiceleaf|custom_ingredient_vinegaritem|sugar