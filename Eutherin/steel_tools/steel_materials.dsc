steel_ingot:
  type: item
  material: iron_ingot
  display name: <&r>Steel Ingot
  data:
      recipe_book_category: misc.steel_ingot
  recipes:
    1:
      type: furnace
      cook time: 1000s
      experience: 0.25
      input: iron_ingot
    2:
      type: blast
      cook time: 500s
      experience: 0.15
      input: iron_ingot
    3:
      type: furnace
      cook time: 1000s
      experience: 0.25
      input: steel_ore
    4:
      type: blast
      cook time: 500s
      experience: 0.15
      input: steel_ore

steel_ore:
  type: item
  material: raw_iron
  display name: <&r>Raw Carbonized Iron
  data:
      recipe_book_category: misc.steel_ore
  recipes:
    1:
      type: shapeless
      input: raw_iron|coal/charcoal|charcoal/coal
