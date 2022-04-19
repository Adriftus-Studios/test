nation_chat_command:
    type: command
    name: nationchat
    description: Switches the player to the chat channel of their nation.
    usage: /nationchat
    alias: /nc
    permission: adriftus.chat.nation
    script:
        - flag <player> chat_H:NATION
