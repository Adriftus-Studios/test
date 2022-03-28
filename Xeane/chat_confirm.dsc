chat_confirm:
  type: task
  debug: false
  data:
    agree_text: <&a><&lb>Accept<&rb>
    deny_text: <&4><&lb>Deny<&rb>
  definitions: prompt|callback
  script:
    - run chat_pause
    - define uuid <util.random_uuid>
    - clickable chat_text_response_handler def:true save:accept
    - clickable chat_text_response_handler def:false save:deny
    - narrate <element[------------------].color_gradient[from=<color[aqua]>;to=<color[white]>]>
    - narrate <[prompt]><&nl><&nl>
    - define list:!|:<element[<script[chat_text_response].parsed_key[data.agree_text]>].on_click[<entry[accept].command>]>
    - define list:|:<element[<script[chat_text_response].parsed_key[data.Deny_text]>].on_click[<entry[DENY].command>]>
    - narrate "   <[list].separated_by[          ]>"
    - narrate <element[------------------].color_gradient[from=<color[aqua]>;to=<color[white]>]>

chat_confirm_handler:
  type: task
  debug: false
  definitions: result|UUID|callback
  script:
    - if !<player.has_flag[tmp.chat_text_response.<[uuid]>]>:
      - flag player tmp.chat_text_response.<[uuid]> duration:30s
      - run chat_unpause
      - run <[callback]> def:<[result]>