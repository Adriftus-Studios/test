skin_unlock_royal_diamond_item:
  type: item
  material: leather_helmet
  display name: <&b>COSMETIC<&co><&6> Royal Diamond Set
  lore:
  - <&e>Right Click while holding
  - <&b>Apply at Spawn!
  mechanisms:
    custom_model_data: 29
    color: <color[#1D03FD]>
  data:
    recipe_book_category: gadgets.royal_diamond
  flags:
    right_click_script: item_skin_unlock
    armor: <list[royal_diamond]>
    tools: list<[diamond_spear|diamond_halberd|diamond_warffork|diamond_warhammer|diamond_greatscythe|diamond_odachi]>
  recipes:
    1:
      type: shaped
      input:
      - triple_compressed_diamond_block|triple_compressed_diamond_block|triple_compressed_diamond_block
      - triple_compressed_diamond_block|royal_crest|triple_compressed_diamond_block
      - triple_compressed_diamond_block|triple_compressed_diamond_block|triple_compressed_diamond_block
