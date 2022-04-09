custom_crop_consume_event_handler:
  type: world
  debug: false
  events:
    on player consumes custom_crop_*:
      - determine passively cancelled
      - actionbar "<&c>You can't eat that raw!"

Customized_food_events:
  type: world
  debug: false
  events:
    on player consumes custom_food_*:
      - determine passively cancelled
      - define item <player.item_in_hand>
      - take iteminhand quantity:1
      - feed amount:<[item].script.data_key[data.amount]> saturation:<[item].script.data_key[data.saturation]>

pufferfish_sushi_event:
  type: world
  debug: false
  events:
    on player consumes custom_food_sushi_pufferfish:
      - if <util.random.int[1].to[20]> > 18:
        - cast nausea amplifier:0 duration:100t
        - cast wither amplifier:1 duration:20t
        - wait 20t
        - cast poison amplifier:1 duration:20t

process_food_data_reload_task:
  type: world
  debug: false
  events:
    on script reload:
      - run process_food_data_task

process_food_data_start_task:
  type: world
  debug: false
  events:
    on server start:
      - run process_food_data_task

process_food_data_task:
  type: task
  debug: false
  script:
    - flag server custom_food_data:!
    - foreach <server.scripts.filter[name.advanced_matches_text[custom_food_*]].parse[name]> as:item:
      - flag server custom_food_data.valid_food:->:<[item]>
    - narrate targets:<server.online_players.filter[has_permission[admin]]> <&e>Food<&sp>Data<&SP><&6>Compiled.
