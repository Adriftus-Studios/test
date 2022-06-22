# -- Contextual Interactions Menu
player_book_menu:
    type: book
    debug: false
    title: Player Menu
    author: Adriftus Studios
    signed: true
    text:
      - <&f><&font[adriftus:mod_tools]><&chr[F80A]><&chr[F809]><&chr[1001]><&r><n><&f><player.flag[amp].get[name]><p><&e><&l><&n>Trade

player_book_menu_item:
  type: item
  debug: false
  material: written_book
  display name: <&b>Player Menu
  lore:
    - "You shouldn't have this."
  book: player_book_menu
