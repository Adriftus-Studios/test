downbad_floyd_replace:
  type: command
  name: downbad_replace
  usage: /downbad_replace
  description: NOT 4 U
  permission: adriftus.admin
  script:
    - create player "<&f>Downbad Floyd" <player.location> save:npc
    - animate <entry[npc].created_npc> SLEEP
    - adjust <player> send_to:test