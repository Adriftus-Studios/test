test_command:
  type: command
  name: xtest
  usage: /xtest
  description: none
  data:
    perms: 1|2|3|4|5
    no_perms: 1|2
  tab completions:
    1: <tern[<player.has_permission[adriftus.staff]>].pass[<script.data_key[data.perms]>].fail[<script.data_key[data.no_perms]>]>