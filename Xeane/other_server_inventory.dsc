other_server_inventory:
  type: task
  debug: false
  script:
    - define server <context.location.flag[server]>
    - ~bungeetag server:<[server]> <player[<player.uuid>].inventory.list_contents.if_null[<list>]> save:inv
    - inventory open "d:generic[title=<&a>Your <[server]> Inventory;contents=<entry[inv].result>]"