skin_unlock_samurai_iron_item:
  type: item
  material: leather_helmet
  display name: <&b>COSMETIC<&co><&6> Samurai Iron Set
  lore:
  - <&e>Right Click while holding
  - <&b>Apply at Spawn!
  mechanisms:
    custom_model_data: 18
    color: <color[#1203FD]>
  data:
    recipe_book_category: gadgets.samurai_iron
  flags:
    right_click_script: item_skin_unlock
    armor: <list[samurai_iron]>
    tools: <list[iron_katana|iron_ono|iron_spade|iron_kama]>
  recipes:
    1:
      type: shaped
      input:
      - triple_compressed_iron_block|triple_compressed_iron_block|triple_compressed_iron_block
      - triple_compressed_iron_block|samurai_headband|triple_compressed_iron_block
      - triple_compressed_iron_block|triple_compressed_iron_block|triple_compressed_iron_block
