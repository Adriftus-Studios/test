skin_unlock_light_chainmail_item:
  type: item
  material: leather_helmet
  display name: <&b>COSMETIC<&co><&6> Light Chainmail Set
  lore:
  - <&e>Right Click while holding
  - <&b>Apply at Spawn!
  mechanisms:
    custom_model_data: 8
    color: <color[#0803FD]>
  data:
    recipe_book_category: gadgets.light_chainmail
  flags:
    right_click_script: item_skin_unlock
    armor: <list[light_chainmail]>
    tools: <list[sword.chainmail_dagger|axe.chainmail_hatchet|shovel.chainmail_pitchfork|pickaxe.chainmail_mallet|hoe.chainmail_sickle]>
  recipes:
    1:
      type: shaped
      input:
      - compressed_iron_ingot|compressed_iron_ingot|compressed_iron_ingot
      - compressed_iron_ingot|chest|compressed_iron_ingot
      - compressed_iron_ingot|compressed_iron_ingot|compressed_iron_ingot
