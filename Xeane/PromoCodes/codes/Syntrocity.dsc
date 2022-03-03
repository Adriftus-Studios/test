promo_code_syntrocity:
  type: data
  expires: false
  expiration_date: <time[2022/04/20_00:00:00]>
  run_task: promo_code_syntrocity_task

promo_code_syntrocity_task:
  type: task
  debug: false
  script:
    - run title_unlock def:Syntrocity
    - execute as_server "lp user <player.name> permission set adriftus.anvil.color"
    - execute as_server "lp user <player.name> permission set adriftus.chat.color"
    - execute as_server "lp user <player.name> permission set adriftus.chat.link_item"
    - narrate "<element[Welcome to the Synternet!].rainbow>"
    - narrate "<&e>You can also use chat colors, and color when renaming items in an anvil.<&nl>You can also link your held item by putting [item] in chat."