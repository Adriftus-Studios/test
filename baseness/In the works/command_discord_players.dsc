players_DCommand:
    type: world
    debug: false
    events:
        on discord message received for:AdriftusBot:
            - define message <context.message>
            - define author <context.author>
            - define channel <context.channel>
            - if <[message].contains_all_text[/players]>:
                - ~discordmessage id:AdriftusBot channel:<[channel]> Testing no_mention
network_players_list:
    type: task
    debug: false
    script:
        - foreach <bungee.list_servers> as:server:
             - narrate <server[<[server]>].online_players.parse[name].formatted>