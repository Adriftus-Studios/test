# -- Contextual Interactions Menu
player_book_menu:
    type: book
    debug: false
    title: Player Menu
    author: Adriftus Studios
    signed: true
    text:
      - <&f><&font[adriftus:mod_tools]><&chr[F80B]><&chr[1001]><n><&c><player.name><p><player.flag[amp].get[name]><p><&e><&l><&n>Trade with Player<p>test test test<p>test test<n>test<n>test

player_book_menu_item:
  type: item
  debug: false
  material: written_book
  display name: <&b>Player Menu
  lore:
    - "You shouldn't have this."
  book: player_book_menu
