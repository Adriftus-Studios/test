ingame_unlink:
  type: command
  debug: false
  name: unlink
  usage: /unlink
  description: unlinks your discord account
  script:
    - if !<player.has_flag[discord.account_linked]>:
      - narrate "<&c>You are not currently connected to discord."
      - stop
    - flag <player.flag[discord.account_linked]> minecraft.account_linked:!
    - narrate "<&a>Unlinked from <player.flag[discord.account_linked].name>.<&nl><&6>A confirmation message has been sent to your DMs by Rachela."
    - ~discordmessage id:rachela user:<player.flag[discord.account_linked]> "Your minecraft account (<player.name>) has been unlinked from Adriftus."
    - flag <player> discord.account_linked:!
