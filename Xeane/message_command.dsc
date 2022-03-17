message_command:
  type: command
  name: msg
  usage: /msg (player) (message)
  description: Message another player
  tab completions:
    1: <server.flag[player_map.names].keys>
  script:
    - if !<server.has_flag[player_map.names.<context.args.get[1]>]>:
      - narrate "<&c>Unknown Player<&co> <&e><context.args.get[1]>"
      - stop
    - if <context.args.size> <= 1:
       - narrate "<&c>You need to include a player and a message!"
       - stop
    - if <server.flag[player_map.names.<context.args.get[1]>.uuid]> == <player.uuid>:
      - narrate "<&c>You can't message yourself..."
      - stop
    # definitions
    - define sender <player.uuid>
    - define uuid <util.random_uuid>
    - define msg <context.args.get[2].to[last].separated_by[<&sp>]>
    - define self_name <proc[get_player_display_name]>
    - define other_name <proc[get_player_display_name].context[<player[<server.flag[player_map.names.<context.args.get[1]>.uuid]>]>]>

    # Allow Chat Colors in Chat
    - if <player.has_permission[adriftus.chat.color]>:
      - define msg <[msg].parse_color>
    - else:
      - define msg <[msg].parse_color.strip_color>

      # Allow Items in Chat
    - if <[msg].contains_text[<&lb>item<&rb>]> && <player.has_permission[adriftus.chat.link_item]>:
      - define msg <[msg].replace_text[<&lb>item<&rb>].with[<&hover[<player.item_in_hand>].type[SHOW_ITEM]><&lb><player.item_in_hand.display||<player.item_in_hand.material.translated_name>><&r><&rb><&end_hover>]>

    # Whisper Channel
    - define WhisperTextSelf "<&7><&lb>MSG<&rb><&r><&e>You<&b>-<&gt><&e><[other_name]><&co> "
    - define WhisperTextOther "<&7><&lb>MSG<&rb><&r><&e><[self_name]><&b>-<&gt><&e>You<&co> "
    # Disabled for Freedom!
    #- define WhisperTextMods "<&7><&lb>MSG<&rb><&r><proc[get_player_display_name]><&b>-<&gt><context.args.get[1].to_titlecase> "

    - define message "<element[<[WhisperTextOther]><[msg]>].on_click[/msg <proc[get_player_display_name].strip_color> ].type[SUGGEST_COMMAND].on_hover[<&e>Click to Reply]>"
    - run bungee_send_message def:<server.flag[player_map.names.<context.args.get[1]>.uuid]>|<[message]>
    - narrate <[WhisperTextSelf]><[msg]>