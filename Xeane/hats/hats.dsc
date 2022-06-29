hat_gui_command:
  type: command
  name: hat
  debug: false
  usage: /hat
  description: Used to access and change any unlocked hats.
  script:
    - run cosmetic_selection_inventory_open def:hats

hat_wear_events:
  type: world
  debug: false
  initialize:
    - flag server hats:!
    - foreach <server.scripts.filter[name.starts_with[hat_]].filter[container_type.equals[DATA]]>:
      - flag server hats.ids.<[value].data_key[hats.id]>.<[value].data_key[hat_data.id]>:<[value]>
  events:
    on player joins:
      - foreach <server.flag[hats]> key:target as:hat:
        - fakeequip <[target]> head:<[hat]> for:<player>
    on custom event id:global_player_data_loaded:
      - if !<player.is_online>:
        - stop
      - if <yaml[global.player.<player.uuid>].contains[hats.current]>:
        - define hat_id <yaml[global.player.<player.uuid>].read[hats.current.id]>
        - define item <yaml[global.player.<player.uuid>].read[hats.current.item]>
        - fakeequip <player> head:<[item]> for:<server.online_players>
        - flag server hats.<player>:<[item]>
    on player quits:
      - if <server.has_flag[hats.<player>]>:
        - fakeequip <player> reset
        - flag server hats.<player>:!
    on server start:
      - inject locally path:initialize
    on script reload:
      - inject locally path:initialize

hat_unlock:
  type: task
  debug: false
  definitions: hat_id
  script:
    - if <server.has_flag[hats.ids.<[hat_id]>]> && !<yaml[global.player.<player.uuid>].contains[hats.unlocked.<[hat_id]>]||false>:
      - run global_player_data_modify def:<player.uuid>|hats.unlocked.<[hat_id]>|true

hat_wear:
  type: task
  debug: false
  definitions: hat_id
  script:
      - determine passively cancelled
      - define hat_id <context.item.flag[cosmetic].if_null[default]> if:<[hat_id].exists.not>
      - if !<script[hat_<[hat_id]>].exists>:
        - debug error "UNKNOWN hat<&co> <[hat_id]>"
        - stop
      - inventory close
      - wait 1t
      - define script <script[hat_<[hat_id]>]>
      - if <[script].data_key[hat_data.permission].exists> && !<player.has_permission[<[script].data_key[hat_data.permission]>]>:
        - narrate "<&c>You lack the permission for this hat."
        - stop
      - run global_player_data_modify def:<player.uuid>|hats.current|<[script].parsed_key[hat_data]>
      - fakeequip <player> head:<[script].parsed_key[hat_data.item]> for:<server.online_players>
      - flag server hats.<player>:<[script].parsed_key[hat_data.item]>

hat_remove:
  type: task
  debug: false
  definitions: hat_id
  script:
    - determine passively cancelled
    - wait 1t
    - run global_player_data_modify def:<player.uuid>|hats.current|!
    - fakeequip reset <player>
    - flag server hats.<player>:!