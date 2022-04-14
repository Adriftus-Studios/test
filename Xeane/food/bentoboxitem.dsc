custom_food_bentobox:
  type: item
  debug: false
  material: apple
  display name: <&a>Bento Box
  data:
    amount: 31
    saturation: 37
  lore:
  - <&e>Hunger: <&f>31 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>37 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 399
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_bamboosteamedrice|custom_food_pickledbeets|custom_food_teriyakichicken|custom_food_sushi