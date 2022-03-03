premium_currency_command:
    type: command
    # The name of the currency is linked to the name datakey of this command
    name: orbsus
    description: A command for the premium currency on this server
    # Might need to change the usage if you change the name
    usage: /orbsus
    script:
        - define currencyName <script[premium_currency_command].data_key[name]>
        - if <context.args.size> > 0 && <player.has_permission[adriftus.economy.other]> && <server.online_players.parse[name].contains[<context.args.get[1]>]>:
            - define player <player[<context.args.get[1]>]>
            - narrate "<&b><[player].name> <[currencyName]> balance is: <[player].flag[economy.premium].round_to[2]>"
        - else if <context.args.size> > 0 && <player.has_permission[adriftus.economy]>:
            - if !<context.args.get[2].exists>:
                - narrate "<&c>Please specify a player name"
                - stop
            - if !<server.online_players.parse[name].contains[<context.args.get[2]>]>:
                - narrate "<&c>That player is not online"
                - stop
            - if !<context.args.get[3].exists>:
                - narrate "<&c>Please specify an amount"
                - stop
            - if !<context.args.get[3].is_integer>:
                - narrate "<&c>Please make sure your amount is a number"
                - stop
            - choose <context.args.get[1]>:
                - case give:
                    - run premium_currency_give def:<context.args.get[2]>|<context.args.get[3]>
                    - narrate "<&a>Successfully deposited <context.args.get[3]> <[currencyName]> to <context.args.get[2]>'s account"
                - case remove:
                    - run premium_currency_remove def:<context.args.get[2]>|<context.args.get[3]> save:outcome
                    - if <entry[outcome].created_queue.determination.first>:
                        - narrate "<&a>Successfully removed <context.args.get[3]> <[currencyName]> from <context.args.get[2]>'s account"
                    - else:
                        - narrate "<&c><context.args.get[2]> does not have enough funds, to remove <context.args.get[3]> <[currencyName]>"
                - case set:
                    - run premium_currency_set def:<context.args.get[2]>|<context.args.get[3]> save:outcome
                    - if <entry[outcome].created_queue.determination.first>:
                        - narrate "<&a>Successfully set <context.args.get[2]>'s account to <context.args.get[3]> <[currencyName]>"
                    - else:
                        - narrate "<&c>You cannot set account balance below 0 <[currencyName]>"
        - else:
            - narrate "<&b>You're <[currencyName]> balance is: <player.flag[economy.premium].round_to[2]>"

premium_currency_event_handler:
    type: world
    events:
        on player joins:
            - if !<player.has_flag[economy.premium]>:
                - flag <player> economy.premium:0

premium_currency_give:
    type: task
    definitions: player|amount
    script:
        - define newBal <player[<[player]>].flag[economy.premium].add[<[amount]>]>
        - flag <player[<[player]>]> economy.premium:<[newBal]>
        - narrate "<&a><[amount]> <script[premium_currency_command].data_key[name]> has been deposited to you're account" targets:<player[<[player]>]>

premium_currency_remove:
    type: task
    definitions: player|amount
    script:
        - define newBal <player[<[player]>].flag[economy.premium].sub[<[amount]>]>
        - if <[newBal]> < 0:
            - determine false
        - flag <player[<[player]>]> economy.premium:<[newBal]>
        - narrate "<&c><[amount]> <script[premium_currency_command].data_key[name]> has been deducted from you're account" targets:<player[<[player]>]>
        - determine true

premium_currency_set:
    type: task
    definitions: player|amount
    script:
        - if <[amount]> < 0:
            - determine false
        - flag <player[<[player]>]> economy.premium:<[amount]>
        - narrate "<&b>You're account has been set to <[amount]> <script[premium_currency_command].data_key[name]>" targets:<player[<[player]>]>
        - determine true