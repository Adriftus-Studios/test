support_bell:
    type: item
    debug: false
    material: bell
    display name: <gold>Support Bell
    lore:
        - Gives you food, fills your hunger bar and fully insta-heals you!
    enchantments:
        - sharpness:5
magic_replenishing_bell:
    type: world
    debug: false
    item: support_bell
    events:
        after player right clicks support_bell:
            - if <player.health_percentage> < 100:
                - heal
                - actionbar "The bell has healed you, <player.name.target>!"
                - hurt <player>
            - else if <player.has_flag[no_more]>
            - if <player.food_level> < 100:
                - feed
                - give cooked_beef quantity:64
                - actionbar "Since you're in full health, you get a stack of steak while being fully fed!"
                - flag player no_more
#Approved, being reworked