fishbot_jade_menu:
  type: inventory
  debug: false
  inventory: chest
  title: Jade's Inventory
  size: 54
  gui: true
  slots:
    - [] [] [] [] [jade_skull_item] [] [] [] []
    - [] [jade_key_item] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []

jade_skull_item:
  type: item
  debug: false
  material: player_head
  mechanisms:
    skull_skin: 33d885df-8840-422c-8ebf-a97a2ae0566c|ewogICJ0aW1lc3RhbXAiIDogMTY1NzY0OTMxNTYzMCwKICAicHJvZmlsZUlkIiA6ICI5ZWEyMTQ0NGFiNjI0MWZkYjg5YjE2NDFhNDg2MGZiZiIsCiAgInByb2ZpbGVOYW1lIiA6ICI3QUJDSE9VTiIsCiAgInNpZ25hdHVyZVJlcXVpcmVkIiA6IHRydWUsCiAgInRleHR1cmVzIiA6IHsKICAgICJTS0lOIiA6IHsKICAgICAgInVybCIgOiAiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS85MTJjYzEzNGIwZDc3YzIxNGVhNDdiNzMzYTMxMGI1YzBkYTY5OTViMzRlMzA2ZTc3ZmI3ZWE3NDEyOWVjOTllIiwKICAgICAgIm1ldGFkYXRhIiA6IHsKICAgICAgICAibW9kZWwiIDogInNsaW0iCiAgICAgIH0KICAgIH0KICB9Cn0=
  lore:
    - <&6>Jade<&sq>s level<&co> <&e><player.flag[fishbot.jade.level]>
    - <&6>Experience to level<&co> <&e><script[fishbot_data_storage].data_key[exp_per_level.<player.flag[fishbot.jade.level]>].sub[<player.flag[fishbot.jade.experience_earned]>]> <&6>(<&e><player.flag[fishbot.jade.experience_earned].div[<script[fishbot_data_storage].data_key[exp_per_level.<player.flag[fishbot.jade.level]>]>]><&pc><&6>)

jade_key_item:
  type: item
  debug: false
  material: tripwire_hook
  mechanisms:
    custom_model_data: 1
  display name: Jades Key Ring
  lore:
  - <&6>Current Keys<&co> <&e><player.flag[fishbot.keys]>
  - <&b>Click<&6> to add more.

jade_boost_info:
  type: item
  debug: false
  material: book
  display name: <&e>Event Schedule!
  lore:
  - <&6>Click to see when planned server boosts will be active.


fishbot_jade_assignment:
  type: assignment
  debug: false
  actions:
    on assignment:
    - trigger name:click state:true
    - trigger name:damage state:true
    on damage:
    - inject fishbot_jade_speech
    on click:
    - inject fishbot_jade_speech


fishbot_jade_speech:
  type: task
  debug: false
  script:
  - if <player.has_flag[fishbot.fishing_now]>:
    - narrate "<&6>Sorry boss, I'm too busy to talk right now, catch me after the trip?"
    - stop
  - if <player.flag[fishbot.caught_items].size> > <element[54].sub[<player.flag[fishbot.barrel_expanded].if_null[0].mul[9]>]>:
    - narrate "<&6>Hey boss, my <&c>barrels are full<&6>. When are you picking up the stuff?"
    - stop
  - else:
    - narrate "<&6>Howdy there, how can I help you?"
    - inventory open d:fishbot_jade_menu
    - stop
