skin_unlock_royal_chainmail_item:
  type: item
  material: leather_helmet
  display name: <&b>COSMETIC<&co><&6> Royal Chainmail Set
  lore:
  - <&e>Right Click while holding
  - <&b>Apply at Spawn!
  mechanisms:
    custom_model_data: 11
    color: <color[#0B03FD]>
  data:
    recipe_book_category: gadgets.royal_chainmail
  flags:
    right_click_script: item_skin_unlock
    armor: <list[royal_chainmail]>
    tools: list<[chainmail_spear|chainmail_halberd|chainmail_warffork|chainmail_warhammer|chainmail_greatscythe|chainmail_odachi]>
  recipes:
    1:
      type: shaped
      input:
      - triple_compressed_iron_ingot|triple_compressed_iron_ingot|triple_compressed_iron_ingot
      - triple_compressed_iron_ingot|royal_crest|triple_compressed_iron_ingot
      - triple_compressed_iron_ingot|triple_compressed_iron_ingot|triple_compressed_iron_ingot
