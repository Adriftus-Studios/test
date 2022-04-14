custom_food_glowberryjelly:
  type: item
  debug: false
  material: apple
  display name: <&a>Glow Berry Jelly
  data:
    amount: 3
    saturation: 4
  lore:
  - <&e>Hunger: <&f>3<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>4<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 194
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|custom_food_glowberryjuice|sugar