monster_jerky:
  type: item
  material: dried_kelp
  display name: <&7>Monster Jerky
  #data:
    #recipe_book_category:  food.monster_jerky
  mechanisms:
    custom_model_data: 10
  recipes:
    1:
      type: smoker
      cook_time: 2s
      experience: 0.5
      input: rotten_flesh
    2:
      type: furnace
      cook_time: 5s
      experience: 0.4
      input: rotten_flesh
