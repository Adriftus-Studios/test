skin_unlock_samurai_chainmail_item:
  type: item
  material: leather_helmet
  display name: <&b>COSMETIC<&co><&6> Samurai Chainmail Set
  lore:
  - <&e>Right Click while holding
  - <&b>Apply at Spawn!
  mechanisms:
    custom_model_data: 12
    color: <color[#0C03FD]>
  data:
    recipe_book_category: gadgets.samurai_chainmail
  flags:
    right_click_script: item_skin_unlock
    armor: <list[samurai_chainmail]>
    tools: list<[chainmail_katana|chainmail_ono|chainmail_spade|chainmail_kama]>
  recipes:
    1:
      type: shaped
      input:
      - triple_compressed_iron_ingot|triple_compressed_iron_ingot|triple_compressed_iron_ingot
      - triple_compressed_iron_ingot|samurai_headband|triple_compressed_iron_ingot
      - triple_compressed_iron_ingot|triple_compressed_iron_ingot|triple_compressed_iron_ingot
