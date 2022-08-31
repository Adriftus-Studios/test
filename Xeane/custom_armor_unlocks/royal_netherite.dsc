skin_unlock_royal_netherite_item:
  type: item
  material: leather_helmet
  display name: <&b>COSMETIC<&co><&6> Royal Netherite Set
  lore:
  - <&e>Right Click while holding
  - <&b>Apply at Spawn!
  mechanisms:
    custom_model_data: 35
    color: <color[#2403FD]>
  data:
    recipe_book_category: gadgets.royal_netherite
  flags:
    right_click_script: item_skin_unlock
    armor: <list[royal_netherite]>
    tools: list<[netherite_spear|netherite_halberd|netherite_warffork|netherite_warhammer|netherite_greatscythe|netherite_odachi]>
  recipes:
    1:
      type: shaped
      input:
      - triple_compressed_netherite_ingot|triple_compressed_netherite_ingot|triple_compressed_netherite_ingot
      - triple_compressed_netherite_ingot|royal_crest|triple_compressed_netherite_ingot
      - triple_compressed_netherite_ingot|triple_compressed_netherite_ingot|triple_compressed_netherite_ingot
