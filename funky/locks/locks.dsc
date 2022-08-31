basic_lock:
    type: item
    material: lever
    display name: <green>Basic Lock
    mechanisms:
        hides: all
    enchantments:
        - UNBREAKING:1
    flags:
        on_placed: cancel
        right_click_script: lock_apply
        locks:
            level: basic

lock_apply:
    type: task
    debug: false
    data:
        lockable:
            - chest
            - barrel
            - furnace
            - blast_furnace
            - smoker
            - hopper
            - brewing_stand
    script:
        - define mat <context.location.material>
        - stop if:<player.is_sneaking>
        # If location is a town and the player is not a resident in the town, stop
        - stop if:<context.location.town.residents.contains[<player>].not||false>
        - stop if:<player.worldguard.can_build[<context.location>].not||false>
        - stop if:<[mat].name.is_in[<script.data_key[data].get[lockable]>].not>
        - stop if:<context.location.has_flag[locks.level]>
        - determine passively cancelled
        - define locf <context.location.proc[get_basic_name]>
        - if <[mat].name> == trapped_chest:
            - log "<player.name> was denied a lock and hurt at <[locf]> because it was a trapped chest. ROFL." info file:logs/locks.log
            - hurt 5 <player> cause:MAGIC source:<player>
            - playsound <player> sound:entity_ghast_scream
            - stop
        # No double chests
        - if <context.location.half.is_in[LEFT|RIGHT]||false>:
            - log "<player.name> was denied a lock at <[locf]> because it was a double chest." info file:logs/locks.log
            - narrate "<red>You cannot apply a lock to a double chest!"
            - playsound <player> sound:entity_villager_no
            - stop
        - take item:<context.item> quantity:1 from:<player.inventory>
        - define uuid <util.random_uuid>
        - flag <context.location> locks.level:<context.item.flag[locks.level]||basic>
        - flag <context.location> locks.allowed:<list_single[<player>]>
        - flag <context.location> locks.original_owner:<player>
        - flag <context.location> locks.uuid:<[uuid]>
        - define ls <context.location.round_down>
        - narrate "<context.item.display||<context.item.material.name.to_titlecase||Basic> Lock><reset><green> applied to <context.location.material.name.replace[_].with[ ].to_titlecase> at <[ls].x> <[ls].y> <[ls].z>!"
        - define lore "<list[<white><bold>Location<&co> <context.location.proc[get_basic_name]>|<empty>|<white>Right click another player to give them access.|<white>Right click the container to manage who can access it.|Shift right click the container to remove the lock.|<empty>|<white><underline>You do not need this key to open the container.]>"
        - define key "<item[imprint_key].with_single[display_name=<[mat].proc[get_basic_name]> Imprint Key].with_single[lore=<[lore]>].with_flag[locks.location:<context.location>].with_flag[locks.original_owner:<player>].with_flag[locks.uuid:<[uuid]>]>"
        - give <[key]> quantity:1 to:<player> slot:<player.held_item_slot>

locked_container_events:
    type: world
    debug: false
    events:
        on player breaks block location_flagged:locks.allowed:
            - if <context.location.flag[locks.allowed].contains[<player>]>:
                - flag <context.location> locks:!
                - narrate "<yellow>You broke the lock that was on this block!"
                - playsound <context.location> sound:block_chain_break pitch:2.0
            - else:
                - narrate "<red>You can't break this <context.location.material.proc[get_basic_name]> because it's locked!"
                - playsound <context.location> sound:entity_villager_no pitch:0.7
                - determine cancelled
        on player right clicks block location_flagged:locks.allowed:
            - if !<context.location.flag[locks.allowed].contains[<player>]> && !<context.item.has_flag[locks_pick.level]>:
                - narrate "<red>Hey! You can't open this! It belongs to <context.location.flag[locks.original_owner].proc[get_basic_name]>!"
                - playsound <context.location> sound:entity_villager_no pitch:1.3
                - determine cancelled
        on item moves from inventory to inventory:
            - if <context.origin.location.has_flag[locks.allowed]>:
                - determine cancelled
        on block destroyed by explosion location_flagged:locks.allowed:
            - determine cancelled
        on block burns location_flagged:locks.allowed:
            - determine cancelled
        on block spreads location_flagged:locks.allowed:
            - determine cancelled
        on cauldron level changes location_flagged:locks.allowed:
            - determine cancelled
        on piston extends:
            - determine cancelled if:<context.blocks.filter_tag[<[filter_value].has_flag[locks.allowed]>].any>
        on piston retracts:
            - determine cancelled if:<context.blocks.filter_tag[<[filter_value].has_flag[locks.allowed]>].any>

imprint_key:
    type: item
    material: tripwire_hook
    display name: <red>Disambiguous Imprint Key
    mechanisms:
        hides: all
    enchantments:
        - UNBREAKING:1

imprint_key_manage_players:
    type: world
    debug: false
    events:
        on player right clicks entity with:item_flagged:locks.location:
            - ratelimit <player> 10t
            - stop if:<context.entity.is_player.not>
            - determine passively cancelled
            - if <context.item.flag[locks.location].flag[locks.allowed].size||0> >= 27:
                - narrate "<red>Can't add anyone else to that container! <&co>(" targets:<player>
                - log "<player.name> maxed out perm'd players at <context.location.proc[get_basic_name]> (<context.location.material.proc[get_basic_name]>)." info file:logs/locks.log
                - stop
            - if <context.item.flag[locks.location].flag[locks.allowed].contains[<context.entity>]||false>:
                - flag <context.item.flag[locks.location]> <context.item.flag[locks.allowed]>:<-:<context.entity>
                - narrate "<green>Removed access from <context.entity.proc[get_basic_name]>." targets:<player>
                - log "<player.name> removed perms of <context.location.proc[get_basic_name]> (<context.location.material.proc[get_basic_name]>) from <context.entity.proc[get_basic_name]>." info file:logs/locks.log
                - stop
            - flag <context.item.flag[locks.location]> locks.allowed:->:<context.entity>
            - log "<player.name> granted perms of <context.location.proc[get_basic_name]> (<context.location.material.proc[get_basic_name]>) to <context.entity.proc[get_basic_name]>." info file:logs/locks.log
            - narrate "<green>Granted access to <context.entity.proc[get_basic_name]>." targets:<player>
        on player right clicks block with:item_flagged:locks.location:
            - ratelimit <player> 5t
            - stop if:<context.item.flag[locks.location].equals[<context.location>].not||true>
            - determine passively cancelled
            - if <player.is_sneaking>:
                - narrate "<green>Removed <context.location.flag[locks.level].if_null[basic].to_titlecase> Lock!"
                - drop <context.location.flag[locks.level].if_null[basic]>_lock <context.location.above[1]> quantity:1
                - playsound <context.location> sound:block_chain_break pitch:2.0
                - log "<player.name> removed <context.location.flag[locks.level]> lock from <context.location.simple> (<context.location.material.proc[get_basic_name]>)." info file:logs/locks.log
                - flag <context.location> locks:!
                - stop
            - define inv <inventory[lock_permissions].include[<item[air]>]>
            - inventory open d:<[inv]>
            - foreach <context.location.flag[locks.allowed].exclude[<player>]> as:target:
                - give to:<[inv]> "player_head[skull_skin=<[target].skull_skin>;custom_model_data=1;display=<white><[target].proc[get_player_display_name]>;flag=run_script:lock_remove_access;flag=person:<[target]>;flag=location:<context.location>;lore=<list_single[<white>Left click to remove.]>]"
            - log "<player.name> began editing perms of <context.location.proc[get_basic_name]> (<context.location.material.proc[get_basic_name]>)." info file:logs/locks.log

lock_permissions:
    type: inventory
    inventory: chest
    title: Allowed Players
    gui: true
    slots:
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []

lock_remove_access:
    type: task
    debug: false
    script:
        - take item:<context.item> from:<context.inventory>
        - flag <context.item.flag[location]> locks.allowed:<-:<context.item.flag[person]>
        - narrate "<green>Removed access from <context.item.flag[person].proc[get_basic_name]||ERROR>."
        - narrate "You got your access removed from the <context.item.flag[location].material.proc[get_basic_name].to_lowercase> at <context.item.flag[location].proc[get_basic_name]>!" targets:<context.item.flag[person]> if:<context.item.flag[person].is_online>
        - log "<player.name> removed perms of <context.item.flag[location].proc[get_basic_name]> (<context.item.flag[location].material.proc[get_basic_name]>) from <context.item.flag[person].proc[get_basic_name]>." info file:logs/locks.log

basic_lock_pick:
    type: item
    material: stick
    display name: <white>Lock Pick
    flags:
        locks_pick:
            level: basic

admin_lock_pick:
    type: item
    material: stick
    display name: <red><bold>Admin Lock Pick
    flags:
        locks_pick:
            level: admin

lock_pick_events:
    type: world
    debug: false
    events:
        on player right clicks block location_flagged:locks.level with:item_flagged:locks_pick.level:
            - ratelimit <player> 3t
            - stop if:<player.is_sneaking.not>
            - stop if:<context.location.flag[locks.allowed].contains[<player>]||false>
            - stop if:<player.worldguard.can_build[<context.location>].not||false>
            - determine passively cancelled
            - define locf <context.location.proc[get_basic_name]>
            - define matf <context.location.material.proc[get_basic_name]>
            - if <context.location.town.residents.contains[<player>]>:
                - narrate "<red>Whoa! You can't pick this lock because it is from a different town!"
                - playsound <player> sound:entity_villager_no
                - log "<player.name> tried to lock pick a lock at <[locf]> but failed because it belongs to town <context.location.town.proc[get_basic_name]>." info file:logs/locks.log
                - stop
            ## Chance == chance of failure
            - choose <context.item.flag[locks_pick.level]>:
                - case basic:
                    - define chance 90
                - case admin:
                    - define chance 0
                    - log "<player.name> used an admin lock pick at <[locf]> (<[matf]>)." info file:logs/locks.log
                - default:
                    - define chance 80
            - if <util.random_chance[<[chance]>]>:
                - take item:<context.item> from:<player.inventory> quantity:1
                - narrate "<red>Your <context.item.proc[get_basic_name]> broke!"
                - playsound <context.location> sound:entity_item_break pitch:2.0
                - log "<player.name> broke a lock pick at <[locf]> (<[matf]>)." info file:logs/locks.log
                - stop
            - flag <context.location> locks:!
            - narrate "<green>You picked the lock!"
            - log "<player.name> picked a lock at <[locf]> (<[matf]>)!" info file:logs/locks.log
            - mcmmo add xp skill:repair quantity:<util.random.int[10].to[50]> player:<player> if:<proc[mcmmo_installed]||false>
            - playsound <context.location> sound:block_chain_break pitch:0.5 volume:2.0
