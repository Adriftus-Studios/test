custom_food_sweetandsourmeatballs:
  type: item
  debug: false
  material: apple
  display name: <&a>Sweet and Sour Meatballs
  data:
    amount: 19
    saturation: 23
  lore:
  - <&e>Hunger: <&f>19<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>23<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1192
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|custom_food_groundbeef|custom_ingredient_sweetandsoursauceitem