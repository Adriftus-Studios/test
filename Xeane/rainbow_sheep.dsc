rainbow_sheep:
  type: assignment
  actions:
    on spawn:
      - while <npc.is_spawned>:
        - foreach <list[red|orange|yellow|green|blue|purple]>:
          - adjust <npc> color:<[value]>
          - wait 1s