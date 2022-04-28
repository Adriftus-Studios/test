steel_ingot:
  type: item
  material: iron_ingot
  data:
      recipe_book_category: misc.steel_ingot
  recipes:
    1:
      type: furnace
      cook time: 100s
      experience: 0.25
      input: iron_ingot
    2:
      type: blast
      cook time: 50s
      experience: 0.15
      input: iron_ingot
    3:
      type: furnace
      cook time: 100s
      experience: 0.25
      input: steel_ore
    4:
      type: blast
      cook time: 50s
      experience: 0.15
      input: steel_ore

steel_ore:
  type: item
  material: iron_ore
  data:
      recipe_book_category: misc.steel_ore
  recipes:
    1:
      type: shapeless
      input: iron_ore|coal/charcoal|charcoal/coal
