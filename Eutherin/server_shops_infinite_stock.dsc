server_shops_config:
  type: data
  ATC_1:
    - trade[result=recipe_book_basic_foods[quantity=1];inputs=currency_copper[quantity=1];max_uses=9999]
    - trade[result=recipe_book_basic_foods_2[quantity=1];inputs=currency_copper[quantity=10];max_uses=9999]
    - trade[result=recipe_book_basic_sushi[quantity=1];inputs=currency_copper[quantity=20];max_uses=9999]
  Thanksgiving_1:
    - trade[result=thanksgiving_hat[quantity=1];inputs=thanksgiving_turkey_token[quantity=5];max_uses=9999]
    - trade[result=food_crate[quantity=1];inputs=thanksgiving_turkey_token[quantity=10];max_uses=9999]
    - trade[result=thanksgiving_cornucopia[quantity=1];inputs=thanksgiving_turkey_token[quantity=30];max_uses=9999]
    - trade[result=thanksgiving_hat_joke[quantity=1];inputs=thanksgiving_turkey_token[quantity=64]|thanksgiving_turkey_token[quantity=11];max_uses=9999]
  Wasteland_Will:
    - trade[result=tipped_arrow[potion_effects=[type=instant_damage;upgraded=false;extended=false]];inputs=orc_tooth[quantity=3];max_uses=9999]
    - trade[result=tipped_arrow[potion_effects=[type=instant_damage;upgraded=true;extended=false]];inputs=orc_tooth[quantity=5];max_uses=9999]
    - trade[result=tipped_arrow[potion_effects=[type=weakness;upgraded=false;extended=false]];inputs=orc_tooth[quantity=3];max_uses=9999]
    - trade[result=tipped_arrow[potion_effects=[type=weakness;upgraded=false;extended=true]];inputs=orc_tooth[quantity=5];max_uses=9999]
    - trade[result=tipped_arrow[potion_effects=[type=slowness;upgraded=false;extended=false]];inputs=orc_tooth[quantity=3];max_uses=9999]
    - trade[result=tipped_arrow[potion_effects=[type=slowness;upgraded=false;extended=true]];inputs=orc_tooth[quantity=5];max_uses=9999]
    - trade[result=tipped_arrow[potion_effects=[type=slowness;upgraded=true;extended=false]];inputs=orc_tooth[quantity=10];max_uses=9999]

server_shop:
  type: assignment
  debug: false
  actions:
    on assignment:
      - trigger name:click state:true
    on click:
      - opentrades <script[server_shops_config].data_key[<npc.flag[shop_id]>]>

orc_tooth:
  type: item
  debug: false
  material: bone
  display name: Orc Tooth
