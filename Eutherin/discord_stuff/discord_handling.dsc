rachela_link_user:
  type: world
  debug: false
  events:
    on discord slash command name:link:
      - define playername <context.options.get[player]>
      - define player <server.match_player[<[playername]>].if_null[<server.match_offline_player[<[playername]>].if_null[null]>]||null>
      - ~discordinteraction defer ephemeral:true interaction:<context.interaction>
      - if <[player]> == null:
        - ~discordinteraction reply interaction:<context.interaction> "Please verify that you have logged in to the minecraft server before." ephemeral:true
        - stop
      - if <[player].has_flag[discord.account_linked]>:
        - if <[player].flag[discord.account_linked]> != <context.interaction.user>:
          - ~discordinteraction reply interaction:<context.interaction> "This account is linked to <[player].flag[discord.account_linked].name>. Please /unlink in game if incorrect." ephemeral:true
          - stop
      - if <context.interaction.user.has_flag[minecraft.account_linked]>:
        - ~discordinteraction reply interaction:<context.interaction> "You are already linked to <context.interaction.user.flag[minecraft.account_linked].name>. Please /unlink if incorrect."
        - stop
      - flag <[player]> discord.account_linked:<context.interaction.user>
      - flag <[player]> discord.notify.linked:<context.interaction.user.name>
      - flag <context.interaction.user> minecraft.account_linked:<[player]>
      - ~discordinteraction reply interaction:<context.interaction> "You have successfully linked to <[player].name>. If incorrect please /unlink and type your complete name more carefully."
      - stop

    on discord slash command name:unlink:
      - ~discordinteraction defer ephemeral:true interaction:<context.interaction>
      - if !<context.interaction.user.has_flag[minecraft.account_linked]>:
        - ~discordinteraction reply interaction:<context.interaction> "This account is not currently associated with any accounts."
        - stop
      - if <context.interaction.user.has_flag[minecraft.account_linked]>:
        - ~discordinteraction reply interaction:<context.interaction> "Now unlinked from <context.interaction.user.flag[minecraft.account_linked].name>"
        - flag <context.interaction.user.flag[minecraft.account_linked]> discord.account_linked:!
        - flag <context.interaction.user.flag[minecraft.account_linked]> discord.notify.unlinked:<context.interaction.user.name>
        - flag <context.interaction.user> minecraft.account_linked:!
        - stop

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
    - ~discordmessage id:rachela user:<player.flag[discord.account_linked]> "Your minecraft account (<player.name>) has been unlinked from Eutherin's Party Haus."
    - flag <player> discord.account_linked:!

create_rachela_link:
  type: task
  debug: false
  script:
  - definemap options:
      1:
        type: string
        name: player
        description: Enter your minecraft account name CAREFULLY.
        required: true

  - ~discordcommand id:Rachela create name:link "description:Enter your minecraft account name CAREFULLY.." group:626078288556851230 options:<[options]>


create_rachela_unlink:
  type: task
  debug: false
  script:

  - ~discordcommand id:Rachela create name:unlink "description:Unlink associated accounts" group:626078288556851230
