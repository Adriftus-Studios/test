rainbow_sheep:
  type: assignment
  actions:
    on spawn:
      - while <npc.is_spawned>:
        - foreach <list[red|orange|yellow|green|blue|purple]>:
          - execute as_server "npc sheep --color <[value]> --id <npc.id>"
          - wait 1s