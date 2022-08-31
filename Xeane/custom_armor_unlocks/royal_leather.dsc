skin_unlock_royal_leather_item:
  type: item
  material: leather_helmet
  display name: <&b>COSMETIC<&co><&6> Royal Leather Set
  lore:
  - <&e>Right Click while holding
  - <&b>Apply at Spawn!
  mechanisms:
    custom_model_data: 4
    color: <color[#0403FD]>
  data:
    recipe_book_category: gadgets.royal_leather
  flags:
    right_click_script: item_skin_unlock
    armor: <list[royal_leather]>
    tools: <list[sword.leather_spear|axe.leather_halberd|shovel.leather_warffork|pickaxe.leather_warhammer|hoe.leather_greatscythe|sword.leather_odachi]>
  recipes:
    1:
      type: shaped
      input:
      - triple_compressed_leather|triple_compressed_leather|triple_compressed_leather
      - triple_compressed_leather|royal_crest|triple_compressed_leather
      - triple_compressed_leather|triple_compressed_leather|triple_compressed_leather
