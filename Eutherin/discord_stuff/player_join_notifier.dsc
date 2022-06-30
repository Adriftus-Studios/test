rachela_link_notifier:
  type: world
  debug: true
  events:
    on player joins:
      - if <player.has_flag[discord.notify.linked]>:
        - wait 10t
        - narrate "<&e><Player.flag[discord.notify.linked]> <&6>has connected to your account via discord.<&nl><&c>If this was in error, please /unlink."
        - flag <player> discord.notify.linked:!
      - if <player.has_flag[discord.notify.unlinked]>:
        - wait 10t
        - if <player.is_spawned>:
          - narrate "<&e><Player.flag[discord.notify.unlinked]> <&6>has discconnected from your account via discord."
          - flag <player> discord.notify.unlinked:!
