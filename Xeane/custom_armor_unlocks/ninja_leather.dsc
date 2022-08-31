skin_unlock_ninja_leather_item:
  type: item
  material: leather_helmet
  display name: <&b>COSMETIC<&co><&6> Ninja Leather Set
  lore:
  - <&e>Right Click while holding
  - <&b>Apply at Spawn!
  mechanisms:
    custom_model_data: 5
    color: <color[#0503FD]>
  data:
    recipe_book_category: gadgets.ninja_leather
  flags:
    right_click_script: item_skin_unlock
    armor: <list[ninja_leather]>
    tools: <list[sword.leather_katana|axe.leather_ono|shovel.leather_spade|hoe.leather_kama]>
  recipes:
    1:
      type: shaped
      input:
      - triple_compressed_leather|triple_compressed_leather|triple_compressed_leather
      - triple_compressed_leather|samurai_headband|triple_compressed_leather
      - triple_compressed_leather|triple_compressed_leather|triple_compressed_leather
