skin_unlock_royal_iron_item:
  type: item
  material: leather_helmet
  display name: <&b>COSMETIC<&co><&6> Royal Iron Set
  lore:
  - <&e>Right Click while holding
  - <&b>Apply at Spawn!
  mechanisms:
    custom_model_data: 17
    color: <color[#1103FD]>
  data:
    recipe_book_category: gadgets.royal_iron
  flags:
    right_click_script: item_skin_unlock
    armor: <list[royal_iron]>
    tools: list<[iron_spear|iron_halberd|iron_warffork|iron_warhammer|iron_greatscythe|iron_odachi]>
  recipes:
    1:
      type: shaped
      input:
      - triple_compressed_iron_block|triple_compressed_iron_block|triple_compressed_iron_block
      - triple_compressed_iron_block|royal_crest|triple_compressed_iron_block
      - triple_compressed_iron_block|triple_compressed_iron_block|triple_compressed_iron_block
