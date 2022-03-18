#- % █████████████████████████████████
#- %            [ Tasks ]
#- % █████████████████████████████████

# % ██ [ Task called to start minigame ] ██
fishing_minigame_start:
    debug: false
    type: task
    definitions: player
    script:
        - flag <[player]> fishingminigame.active:true
        - flag <[player]> fishingminigame.savedinventory:<[player].inventory.map_slots>
        - if !<[player].has_flag[fishingminigame.bucket]>:
            - flag <[player]> fishingminigame.bucket.fish:<list[]>
            - flag <[player]> fishingminigame.bucket.size:20
            - flag <[player]> fishingminigame.fishtokens:0
        - if !<[player].has_flag[fishingminigame.stats]>:
            - flag <[player]> fishingminigame.stats.daily.catch:0
            - flag <[player]> fishingminigame.stats.daily.value:0
            - flag <[player]> fishingminigame.stats.alltime.catch:0
            - flag <[player]> fishingminigame.stats.alltime.value:0
            - flag <[player]> fishingminigame.stats.alltime.bestcatch:none
        - if !<[player].has_flag[fishingminigame.stats.bestcatch]>:
            - foreach <proc[fishing_minigame_get_all_types]> as:type:
                - flag <[player]> fishingminigame.stats.bestcatch.<[type]>:none
        - run fishing_minigame_set_inventory def:<[player]>
        - title title:<&a>Fishing "subtitle:<&a>Find a whirlpool in a lake, and begin catching!" targets:<[player]>
        - narrate "<&7>You are now in fishing mode. If you at any point would like to return to normal, look for a barrier in your inventory. Typing any command will revert you back to normal."

# % ██ [ Task called to stop minigame ] ██
fishing_minigame_stop:
    debug: false
    type: task
    definitions: player
    script:
        - flag <[player]> fishingminigame.active:false
        - run fishing_minigame_reset_inventory def:<[player]>
        - title 'title:<&c>Fishing Exited' "subtitle:<&c>Your fishing session is over!" targets:<[player]>
        - narrate "<&e>Your fishing session is over. If you would like to resume, just speak to the fish merchant again"
        - if <player.has_flag[fishing_minigame_playing_music]>:
            - queue <player.flag[fishing_minigame_music_queue]> stop
            - midi cancel
            - flag <player> fishing_minigame_playing_music:!

# % ██ [ Task called when bucket is bucket is clicked ] ██
fishing_minigame_open_bucket:
    debug: false
    type: task
    definitions: player|merchant
    script:
        - run fishing_minigame_bucket_open_gui def:<[player]>|<[merchant]>

# % ██ [ Task used to set player inv for minigame ] ██
fishing_minigame_set_inventory:
    debug: false
    type: task
    definitions: player
    script:
        - inventory clear
        - inventory set o:fishing_minigame_bad_rod slot:1
        - inventory set o:<proc[fishing_minigame_get_bucket_type].context[<[player]>]> slot:2
        - inventory set o:<proc[fishing_minigame_get_fishtoken_item].context[<[player]>]> slot:3
        - inventory set o:fishing_minigame_end_game slot:9
        - inventory set o:fishing_minigame_statistics_book_inv slot:8
        - inventory set o:fishing_minigame_mp3_player slot:7

# % ██ [ Task used to reset player inventory ] ██
fishing_minigame_reset_inventory:
    debug: false
    type: task
    definitions: player
    script:
        - inventory clear
        - define saved <[player].flag[fishingminigame.savedinventory]>
        - foreach <[saved]> as:item key:slot:
            - inventory set o:<[item]> slot:<[slot]>

# % ██ [ Helper script just in case we need to reset whirlpools ] ██
fishing_minigame_reset_whirlpool_locations:
    debug: false
    type: task
    script:
        - flag server fishing_minigame_whirlpool_locations:<proc[fishing_minigame_generate_possible_whirlpool_locations].context[<cuboid[fishing_minigame_pond]>]>
        - foreach <server.flag[fishing_minigame_whirlpool_locations]> as:loc:
            - playeffect at:<[loc].up> flame offset:0 targets:<server.online_players>

# % ██ [ Task used to reset the whirlpools generated ] ██
fishing_minigame_reset_whirlpools:
    debug: false
    type: task
    script:
        - ~run fishing_minigame_destroy_whirlpools
        - flag server fishing_minigame_reset_whirlpools
        - flag server fishing_minigame_active_whirlpool_locations:<list[]>

# % ██ [ Task used to generate random whirlpools on the water inside given cuboid ] ██
fishing_minigame_generate_whirlpools:
    debug: false
    type: task
    definitions: amount
    script:
        - ~run fishing_minigame_reset_whirlpools
        - wait 5t
        - flag server fishing_minigame_reset_whirlpools:!
        - define list <list[]>
        - while <[list].size> < <[amount]>:
            - define whirlpoolLoc <server.flag[fishing_minigame_whirlpool_locations].random>
            - foreach <[list]> as:loc:
                - if <proc[whirlpools_intersect].context[<[loc]>|<[whirlpoolLoc]>]>:
                    - while next
            - define list:->:<[whirlpoolLoc]>
        - flag server fishing_minigame_active_whirlpool_locations:<[list]>
        - run fishing_minigame_build_whirlpools

# % ██ [ Task used to destroy the actual whirlpool entities ] ██
fishing_minigame_destroy_whirlpools:
    debug: false
    type: task
    script:
        - foreach <server.flag[fishing_minigame_active_whirlpool_locations]> key:loc as:entity:
            - remove <[entity].get[entity].unescaped>
            - flag server fishing_minigame_active_whirlpool_locations.<[loc]>.entity:!
            - flag <[loc]> whirlpool:!

# % ██ [ Task used to summon the actual whirlpool entities ] ██
fishing_minigame_build_whirlpools:
    debug: false
    type: task
    script:
        - foreach <server.flag[fishing_minigame_active_whirlpool_locations]> as:loc:
            - define stand <entity[armor_stand]>
            - spawn <[stand]> <[loc]> save:entity persistent
            - adjust <entry[entity].spawned_entity> gravity:false
            - adjust <entry[entity].spawned_entity> marker:true
            - invisible <entry[entity].spawned_entity> state:true
            - flag server fishing_minigame_active_whirlpool_locations.<[loc]>.entity:<entry[entity].spawned_entity.escaped>
        - run fishing_minigame_whirlpool_animation

# % ██ [ Task for whirlpool animations ] ██
fishing_minigame_whirlpool_animation:
    type: task
    debug: false
    script:
        - define circles <server.flag[fishing_minigame_active_whirlpool_locations].keys.parse[up.with_pitch[90].proc[define_circle].context[1|0.1]].combine>
        - while !<server.has_flag[fishing_minigame_reset_whirlpools]>:
            - playeffect at:<[circles]> dolphin offset:0.05,0.05,0.05 targets:<proc[fishing_minigame_player_list]>
            - wait 1t
        - flag server fishing_minigame_reset_whirlpools:!

# % ██ [ Adds a fish to a bucket (returns false if failed) ] ██
fishing_minigame_bucket_add:
    debug: false
    type: task
    definitions: player|fish
    script:
        - if <proc[fishing_minigame_bucket_full]>:
            - determine false

        - flag <[player]> fishingminigame.bucket.fish:<[player].flag[fishingminigame.bucket.fish].include[<[fish]>]>

        # % ██ [ Code for statistics ] ██
        - flag <[player]> fishingminigame.stats.daily.catch:<[player].flag[fishingminigame.stats.daily.catch].add[1]>
        - flag <[player]> fishingminigame.stats.alltime.catch:<[player].flag[fishingminigame.stats.alltime.catch].add[1]>
        - define value <proc[fishing_minigame_fish_value].context[<[fish]>]>
        - flag <[player]> fishingminigame.stats.daily.value:<[player].flag[fishingminigame.stats.daily.value].add[<[value]>]>
        - flag <[player]> fishingminigame.stats.alltime.value:<[player].flag[fishingminigame.stats.alltime.value].add[<[value]>]>

        # % ██ [ Best catch statistic ] ██
        - if <[player].flag[fishingminigame.stats.alltime.bestcatch].equals[none]>:
            - flag <[player]> fishingminigame.stats.alltime.bestcatch:<[fish].escaped>
        - else:
            - if <[value]> > <proc[fishing_minigame_fish_value].context[<[player].flag[fishingminigame.stats.alltime.bestcatch].unescaped>]>:
                - flag <[player]> fishingminigame.stats.alltime.bestcatch:<[fish].escaped>
        # % ██ [ Best catch statistic per fish] ██
        - define attributes <[fish].flag_map>
        - define type <[attributes].get[type]>
        - define rarity <[attributes].get[rarity]>
        - if <[player].flag[fishingminigame.stats.bestcatch.<[type]>].equals[none]>:
            - flag <[player]> fishingminigame.stats.bestcatch.<[type]>:<[fish].escaped>
        - else:
            - if <[value]> > <proc[fishing_minigame_fish_value].context[<[player].flag[fishingminigame.stats.bestcatch.<[type]>].unescaped>]>:
                - flag <[player]> fishingminigame.stats.bestcatch.<[type]>:<[fish].escaped>

        # % ██ [ Server best catch statistic ] ██
        - if <server.flag[fishingminigame.bestcatch.fish].equals[none]>:
            - flag server fishingminigame.bestcatch.fish:<[fish].escaped>
            - flag server fishingminigame.bestcatch.player:<[player].uuid>
        - else:
            - if <[value]> > <proc[fishing_minigame_fish_value].context[<server.flag[fishingminigame.bestcatch.fish].unescaped>]>:
                - flag server fishingminigame.bestcatch.fish:<[fish].escaped>
                - flag server fishingminigame.bestcatch.player:<[player].uuid>

        # % ██ [ Print rare fish to the server ] ██
        - if <[rarity].equals[legendary]>:
            - narrate "<&7><&l><&lt>!<&gt><&r> <&b><&l><player.name> <&r><&7>has just caught a <element[<bold>Legendary].color_gradient[from=#FF930F;to=#FFE15C]><&r> <[fish].display.on_hover[<[fish]>].type[SHOW_ITEM]>" targets:<server.online_players>

        - run fishing_minigame_narrate_fish def:<[player]>|<[fish]>
        - if <player.has_flag[fishingminigame.active]> && <player.flag[fishingminigame.active]>:
            - run fishing_minigame_update_bucket def:<[player]>
        - determine true

# % ██ [ Removes a fish from a bucket ] ██
fishing_minigame_bucket_remove:
    debug: false
    type: task
    definitions: player|fish
    script:
        - flag <[player]> fishingminigame.bucket.fish:<[player].flag[fishingminigame.bucket.fish].exclude[<[fish]>]>
        - if <player.has_flag[fishingminigame.active]> && <player.flag[fishingminigame.active]>:
            - run fishing_minigame_update_bucket def:<[player]>

# % ██ [ Task to narrate fish (imagine it as a to_string xD) ] ██
fishing_minigame_narrate_fish:
    debug: false
    type: task
    definitions: player|fish
    script:
        - narrate "<&a>You just caught a (The fish will be in your bucket):" targets:<[player]>
        - narrate " <[fish].display>" targets:<[player]>
        - foreach <[fish].lore> as:line:
            - if <[fish].lore.find[<[line]>]> > 1 && <[fish].lore.find[<[line]>]> < 6:
                - define line "<&8>| <[line]>"
            - narrate <[line]> targets:<[player]>

# % ██ [ Task to update the players bucket in their inventory ] ██
fishing_minigame_update_bucket:
    debug: false
    type: task
    definitions: player
    script:
        - define currentBucket <[player].inventory.slot[2]>
        - define fishAmount <[player].flag[fishingminigame.bucket.fish].size>
        - define updatedBucket <proc[fishing_minigame_get_bucket_type].context[<[player]>]>
        - if !<[currentBucket].equals[<[updatedBucket]>]>:
            - inventory set o:<[updatedBucket]> slot:2

# % ██ [ Adds given amount of tokens to given player ] ██
fish_tokens_add:
    debug: false
    type: task
    definitions: player|amount
    script:
        - flag <[player]> fishingminigame.fishtokens:<[player].flag[fishingminigame.fishtokens].add[<[amount]>]>
        - narrate "<&a><[amount].round_to[2]> <&r><&font[adriftus:chat]><&chr[0045]><&r><&a> has been deposited to your account" targets:<[player]>
        - if <player.has_flag[fishingminigame.active]> && <player.flag[fishingminigame.active]>:
            - inventory set o:<proc[fishing_minigame_get_fishtoken_item].context[<[player]>]> slot:3

# % ██ [ Removes given amount of tokens to given player ] ██
fish_tokens_remove:
    debug: false
    type: task
    definitions: player|amount
    script:
        - define newBal <player.flag[fishingminigame.fishtokens].sub[<[amount]>]>
        - if <[newBal]> < 0:
            - determine false
        - flag <[player]> fishingminigame.fishtokens:<[player].flag[fishingminigame.fishtokens].sub[<[amount]>]>
        - narrate "<&c><[amount].round_to[2]> <&r><&font[adriftus:chat]><&chr[0045]><&r><&c> has been deducted from your account" targets:<[player]>
        - if <player.has_flag[fishingminigame.active]> && <player.flag[fishingminigame.active]>:
            - inventory set o:<proc[fishing_minigame_get_fishtoken_item].context[<[player]>]> slot:3
        - determine true

# % ██ [ Adds given amount of tokens to given player ] ██
fishing_minigame_reset_leaderboards:
    debug: false
    type: task
    script:
        - define players <server.players_flagged[fishingminigame.stats.daily.catch]>
        - foreach <[players]> as:pl:
            - flag <[pl]> fishingminigame.stats.daily.catch:0
            - flag <[pl]> fishingminigame.stats.daily.value:0
        - flag server fishingminigame.bestcatch.fish:none
        - flag server fishingminigame.bestcatch.player:none

# % ██ [ Open Statistics book ] ██
fishing_minigame_stats_book_open:
    debug: false
    type: task
    definitions: player
    script:
        - define book <item[fishing_minigame_stats_book]>
        - define pages <list[]>

        - define page1:->:<n>
        - define "page1:->:<&sp><&sp><&sp><&sp><element[Fishing Statistics].color_gradient[from=#00D540;to=#009A08]><n>"
        - define page1:->:<n>
        - define page1:->:<n><&7>+-----------------+
        - define "page1:->:<n><&7>+ <&r>Fish Caught:"
        - define "page1:->:<n><&7>+ <&2><[player].flag[fishingminigame.stats.alltime.catch].format_number>"
        - define "page1:->:<n><&7>+ <&r>Total Value:"
        - define "page1:->:<n><&7>+ <&2><[player].flag[fishingminigame.stats.alltime.value].round_to[2].format_number> <&f><&font[adriftus:chat]><&chr[0045]>"
        - define "page1:->:<n><&7>+ <&r>Best Catch:"
        - if <[player].flag[fishingminigame.stats.alltime.bestcatch].equals[none]>:
            - define "page1:->:<n><&7>+ <&c>[<&4>None<&c>]"
        - else:
            - define fishName <[player].flag[fishingminigame.stats.alltime.bestcatch].unescaped>
            - define "page1:->:<n><&7>+ <&2>[<&9><[fishName].display.strip_color.on_hover[<[player].flag[fishingminigame.stats.alltime.bestcatch].unescaped>].type[SHOW_ITEM]><&2>]"
        - define page1:->:<n><&7>+-----------------+
        - define page1:->:<n>
        - define "page1:->:<n><element[Per Fish Stats <&sp><&sp><&sp><&sp>--<&gt>].color_gradient[from=#0053BF;to=#009DD6]>"
        - define pages:->:<[page1].unseparated>

        - foreach <list[legendary|epic|rare|uncommon|common].reverse> as:rarity:
            - define newPage:->:<n>
            - define newPage:->:<&1><[rarity].to_titlecase.bold><n>
            - define newPage:->:<n>
            - foreach <proc[fishing_minigame_get_all_types_by_rarity].context[<[rarity]>]> as:type:
                - define newPage:->:<&8><[type].to_titlecase><&co><n>
                - if <[player].flag[fishingminigame.stats.bestcatch.<[type]>].equals[none]>:
                    - define "newPage:->:<&7>+ <&c>[<&4>None<&c>]<n>"
                - else:
                    - define fishItem <[player].flag[fishingminigame.stats.bestcatch.<[type]>].unescaped>
                    - define "newPage:->:<&7>+ <&2>[<&9><element[Hover].on_hover[<[fishItem]>].type[SHOW_ITEM]><&2>]<n>"

            - define pages:->:<[newPage].unseparated>
            - define newPage <list[]>

        - adjust def:book book_pages:<[pages]>
        - adjust <[player]> show_book:<[book]>

# % ██ [ Plays the given song to the given player ] ██
fishing_minigame_play_song:
    debug: false
    type: task
    definitions: player|song
    script:
        - ~midi <[song]> <[player]>
        - flag <[player]> fishing_minigame_playing_music:!

# % ██ [ Sells all players fish ] ██
fishing_minigame_sell_all_fish:
    debug: false
    type: task
    definitions: player
    script:
        - define value <[player].flag[fishingminigame.bucket.fish].parse[proc[fishing_minigame_fish_value]].sum>
        - flag <[player]> fishingminigame.bucket.fish:<list[]>
        - if <player.has_flag[fishingminigame.active]> && <player.flag[fishingminigame.active]>:
            - run fishing_minigame_update_bucket def:<[player]>
        - if <[value]> > 0:
            - run fish_tokens_add def:<player>|<[value]>
        - else:
            - narrate "<&c>Theres nothing to sell!"

# % ██ [ Plays the given song to the given player ] ██
fishing_minigame_show_off:
    debug: false
    type: task
    definitions: player|fish
    script:
        - ratelimit <[player]> 10s
        - narrate "<&7><&l><&lt>!<&gt><&r> <&7>Check out this fish <[player].name> caught: <[fish].display.on_hover[<[fish]>].type[SHOW_ITEM]>" targets:<server.online_players>

#- % █████████████████████████████████
#- %          [ Procedures ]
#- % █████████████████████████████████

# % ██ [ Returns the available midi tracks ] ██
fishing_minigame_get_all_music_tracks:
    debug: false
    type: procedure
    script:
        - define tracks <server.list_files[midi/mp3_player]>
        - define music <map[]>
        - foreach <[tracks]> as:track:
            - define track <[track].replace[.mid].with[]>
            - define split <[track].split[-]>
            - define music <[music].include[<[split].get[1]>=<map[author=<[split].get[2]>;filename=mp3_player/<[track]>]>]>
        - determine <[music]>

# % ██ [ Returns the token item with the balance ] ██
fishing_minigame_get_fishtoken_item:
    debug: false
    type: procedure
    definitions: player
    script:
        - define fishtokenwallet <item[fishing_minigame_fishtoken_item]>
        - define displayName "<&d><&l><[player].flag[fishingminigame.fishtokens].round_to[2].format_number> Fishtokens"
        - adjust def:fishtokenwallet display:<[displayName]>
        - determine <[fishtokenwallet]>

# % ██ [ Returns the proper bucket item ] ██
fishing_minigame_get_bucket_type:
    debug: false
    type: procedure
    definitions: player
    script:
        - define fishAmount <[player].flag[fishingminigame.bucket.fish].size>
        - if <[fishAmount]> == 0:
            - determine fishing_minigame_fish_bucket_empty
        - else if <proc[fishing_minigame_bucket_full].context[<[player]>]>:
            - determine fishing_minigame_fish_bucket_full
        - else if <[fishAmount]> > 0:
            - determine fishing_minigame_fish_bucket

# % ██ [ Procedure for finding nearest whirlpool ] ██
fishing_minigame_find_nearest_whirlpool:
    debug: false
    type: procedure
    definitions: loc
    script:
        - define closestWhirlpool <server.flag[fishing_minigame_active_whirlpool_locations].keys.first>
        - define distance <server.flag[fishing_minigame_active_whirlpool_locations].keys.first>
        - foreach <server.flag[fishing_minigame_active_whirlpool_locations]> key:loc as:entity:
            - if <[closestWhirlpool].distance[<[loc]>]> < <[distance]>:
                - define closestWhirlpool <[loc]>
                - define distance <[closestWhirlpool].distance[<[loc]>]>
        - determine <[closestWhirlpool]>

# % ██ [ Checks if 2 given whirlpools intersect ] ██
whirlpools_intersect:
    debug: false
    type: procedure
    definitions: loc1|loc2
    script:
        - define blockList1 <list[<[loc1]>|<[loc1].right>|<[loc1].backward>|<[loc1].right.backward>]>
        - define blockList2 <list[<[loc2]>|<[loc2].right>|<[loc2].backward>|<[loc2].right.backward>]>
        - determine <[blockList1].contains_any[<[blockList2]>]>

# % ██ [ Function to check if the given location is in whirlpool (used fo the fish hook) ] ██
fishing_minigame_location_in_whirlpool:
    debug: false
    type: procedure
    definitions: location
    script:
        - define closest <server.flag[fishing_minigame_active_whirlpool_locations].keys.sort_by_number[distance[<[location]>]].first>
        - if <[closest].distance[<[location].with_y[<[closest].y>]>]> <= 1.1:
            - determine true
        - determine false

# % ██ [ Returns a random quality ] ██
fishing_minigame_get_random_quality:
    debug: false
    type: procedure
    script:
        - foreach <list[amazing|great|good|okay|bad]> as:quality:
            - if <util.random_chance[<script[fishing_minigame_fish_table].data_key[quality.<[quality]>.weight]>]>:
                - determine <[quality]>

# % ██ [ Returns a random rarity ] ██
fishing_minigame_get_random_rarity:
    debug: false
    type: procedure
    script:
        - foreach <list[legendary|epic|rare|uncommon|common]> as:rarity:
            - if <util.random_chance[<script[fishing_minigame_fish_table].data_key[fish.<[rarity]>.weight]>]>:
                - determine <[rarity]>

# % ██ [ Returns a random fish type from that rarity ] ██
fishing_minigame_get_random_type:
    debug: false
    type: procedure
    definitions: rarity
    script:
        - determine <script[fishing_minigame_fish_table].data_key[fish.<[rarity]>].exclude[weight].keys.random>

# % ██ [ Get rarity by type ] ██
fishing_minigame_get_rarity_by_type:
    debug: false
    type: procedure
    definitions: type
    script:
        - foreach <list[legendary|epic|rare|uncommon|common]> as:rarity:
            - if <script[fishing_minigame_fish_table].data_key[fish.<[rarity]>].exclude[weight].keys.contains[<[type]>]>:
                - determine <[rarity]>

# % ██ [ Returns all fish types ] ██
fishing_minigame_get_all_types:
    debug: false
    type: procedure
    script:
        - define types <list[]>
        - foreach <list[legendary|epic|rare|uncommon|common]> as:rarity:
            - define types:|:<script[fishing_minigame_fish_table].data_key[fish.<[rarity]>].exclude[weight].keys>
        - determine <[types]>

# % ██ [ Returns all fish types ] ██
fishing_minigame_get_all_types_by_rarity:
    debug: false
    type: procedure
    definitions: rarity
    script:
        - determine <script[fishing_minigame_fish_table].data_key[fish.<[rarity]>].exclude[weight].keys>

# % ██ [ Returns a color for the weight based on the random value ] ██
fishing_minigame_get_color_for_weight:
    debug: false
    type: procedure
    definitions: random
    script:
        - if <[random]> < 0.2:
            - determine <script[fishing_minigame_fish_table].parsed_key[quality.bad.color]>
        - else if <[random]> < 0.4:
            - determine <script[fishing_minigame_fish_table].parsed_key[quality.okay.color]>
        - else if <[random]> < 0.6:
            - determine <script[fishing_minigame_fish_table].parsed_key[quality.good.color]>
        - else if <[random]> < 0.8:
            - determine <script[fishing_minigame_fish_table].parsed_key[quality.great.color]>
        - else if <[random]> <= 1:
            - determine <script[fishing_minigame_fish_table].parsed_key[quality.amazing.color]>

# % ██ [ Returns a random weight from that fish type and rarity ] ██
fishing_minigame_get_random_weight_and_size:
    debug: false
    type: procedure
    definitions: type|rarity
    script:
        - define minWeight <script[fishing_minigame_fish_table].data_key[fish.<[rarity]>.<[type]>.minWeight]>
        - define maxWeight <script[fishing_minigame_fish_table].data_key[fish.<[rarity]>.<[type]>.maxWeight]>
        - define diffWeight <[maxWeight].sub[<[minWeight]>]>
        - define minSize <script[fishing_minigame_fish_table].data_key[fish.<[rarity]>.<[type]>.minSize]>
        - define maxSize <script[fishing_minigame_fish_table].data_key[fish.<[rarity]>.<[type]>.maxSize]>
        - define diffSize <[maxSize].sub[<[minSize]>]>
        - define random <util.random.decimal[0].to[1].power[2]>
        - define weightColor <proc[fishing_minigame_get_color_for_weight].context[<[random]>]>
        - determine <map[weight=<[random].mul[<[diffWeight]>].add[<[minWeight]>].round_to[2]>;size=<[random].mul[<[diffSize]>].add[<[minWeight]>].round_to[2]>;color=<[weightColor]>]>

# % ██ [ Returns a random fish item ] ██
fishing_minigame_get_random_fish:
    debug: false
    type: procedure
    script:
        - define rarity <proc[fishing_minigame_get_random_rarity]>
        - define type <proc[fishing_minigame_get_random_type].context[<[rarity]>]>
        - define weightAndSize <proc[fishing_minigame_get_random_weight_and_size].context[<[type]>|<[rarity]>]>
        - define quality <proc[fishing_minigame_get_random_quality]>
        - define valueMulti <script[fishing_minigame_fish_table].data_key[fish.<[rarity]>.<[type]>.valueMulti]>
        - define perfectWeight <script[fishing_minigame_fish_table].data_key[fish.<[rarity]>.<[type]>.maxWeight]>
        - define rarityColor <script[fishing_minigame_fish_table].parsed_key[rarity.<[rarity]>.color]>
        - define qualityColor <script[fishing_minigame_fish_table].parsed_key[quality.<[quality]>.color]>
        - define weightColor <[weightAndSize].get[color]>
        - define perfect false
        - define bestWeight false
        - if <[weightAndSize].get[weight].equals[<[perfectWeight]>]>:
            - define bestWeight true
            - if <[quality].equals[amazing]>:
                - define perfect true

        - define fish <item[tropical_fish]>

        - define lore:|:<&8>+------------------+
        - if !<[rarity].equals[legendary]>:
            - define "lore:|:<&r><&e>Rarity: <&f><[rarityColor]><[rarity].to_sentence_case>"
        - else:
            - define "lore:|:<&r><&e>Rarity: <&f><element[<bold><[rarity].to_sentence_case>].color_gradient[from=#FF930F;to=#FFE15C]>"

        - if <[quality].equals[amazing]>:
            - define "lore:|:<&r><&e>Quality: <&f><&color[<[qualityColor]>]><&l><[quality].to_sentence_case>"
        - else:
            - define "lore:|:<&r><&e>Quality: <&f><&color[<[qualityColor]>]><[quality].to_sentence_case>"

        - if <[bestWeight]>:
            - define "lore:|:<&r><&e>Weight: <&f><&color[<[weightColor]>]><&l><[weightAndSize].get[weight]> lbs"
            - define "lore:|:<&r><&e>Size: <&f><&color[<[weightColor]>]><&l><[weightAndSize].get[size]> in."
        - else:
            - define "lore:|:<&r><&e>Weight: <&f><&color[<[weightColor]>]><[weightAndSize].get[weight]> lbs"
            - define "lore:|:<&r><&e>Size: <&f><&color[<[weightColor]>]><[weightAndSize].get[size]> in."
        - define lore:|:<&8>+------------------+

        - adjust def:fish display:<&r><&f><[rarityColor]><[type].to_sentence_case>
        - adjust def:fish lore:<[lore]>
        - if <[perfect]>:
            - adjust def:fish enchantments:empty=1
        - adjust def:fish flag_map:<map[type=<[type]>;rarity=<[rarity]>;quality=<[quality]>;weight=<[weightAndSize].get[weight]>;size=<[weightAndSize].get[size]>;valueMulti=<[valueMulti]>;perfect=<[perfect]>]>
        - determine <[fish]>

# % ██ [ Returns a list of every possible whirlpool location ] ██
fishing_minigame_generate_possible_whirlpool_locations:
    debug: false
    type: procedure
    definitions: cuboid
    script:
        - define validLocations <list[]>
        - foreach <[cuboid].blocks[water]> as:water:
            - if <[water].right.is_liquid> && <[water].backward.is_liquid> && <[water].right.backward.is_liquid>:
                - if <[water].up.material.name.equals[air]> && <[water].right.up.material.name.equals[air]> && <[water].backward.up.material.name.equals[air]> && <[water].right.backward.up.material.name.equals[air]>:
                    - define validLocations:->:<[water]>
        - determine <[validLocations]>

# % ██ [ Returns whether the bucket is full or not ] ██
fishing_minigame_bucket_full:
    debug: false
    type: procedure
    definitions: player
    script:
        - define fishAmount <[player].flag[fishingminigame.bucket.fish].size>
        - define maxSize <[player].flag[fishingminigame.bucket.size]>
        - determine <[fishAmount].is_less_than[<[maxSize]>].not>

# % ██ [ Returns the fish value based on its attributes ] ██
fishing_minigame_fish_value:
    debug: false
    type: procedure
    definitions: fish
    script:
        - define attributes <[fish].flag_map>
        - define rarityMulti <script[fishing_minigame_fish_table].parsed_key[rarity.<[attributes].get[rarity]>.multi]>
        - define qualityMulti <script[fishing_minigame_fish_table].parsed_key[quality.<[attributes].get[quality]>.multi]>
        # % ██ [ Weight * Size * Fish Value Multi * Rarity Multi * Quality Multi ] ██
        - determine <[attributes].get[weight].mul[<[attributes].get[size]>].mul[<[attributes].get[valueMulti]>].mul[<[rarityMulti]>].mul[<[qualityMulti]>]>

# % ██ [ Returns a list of players who have the most catches ] ██
fishing_minigame_top_catchers_daily:
    debug: false
    type: procedure
    script:
        - define players <server.players_flagged[fishingminigame.stats.daily.catch]>
        - foreach <[players]> as:pl:
            - if <[pl].flag[fishingminigame.stats.daily.value]> == 0:
                - define players <[players].exclude[<[pl]>]>
        - determine <[players].sort_by_number[flag[fishingminigame.stats.daily.catch]].reverse>

# % ██ [ Returns a list of players who have the most value ] ██
fishing_minigame_top_value_daily:
    debug: false
    type: procedure
    script:
        - define players <server.players_flagged[fishingminigame.stats.daily.value]>
        - foreach <[players]> as:pl:
            - if <[pl].flag[fishingminigame.stats.daily.value]> == 0:
                - define players <[players].exclude[<[pl]>]>
        - determine <[players].sort_by_number[flag[fishingminigame.stats.daily.value]].reverse>

# % ██ [ Returns a list of players ] ██
fishing_minigame_player_list:
    debug: false
    type: procedure
    script:
        - define players <list[]>
        - foreach <server.online_players_flagged[fishingminigame.active]> as:player:
            - if <[player].flag[fishingminigame.active]>:
                - define players:->:<[player]>
        - determine <[players]>

#- % █████████████████████████████████
#- %           [ Enchants ]
#- %   Why the fuck this exists idk
#- % █████████████████████████████████

fishing_minigame_enchant:
    debug: false
    type: enchantment
    id: empty
    slots:
    - mainhand

#- % █████████████████████████████████
#- %            [ Events ]
#- % █████████████████████████████████

# % ██ [ Minigame Timed Events Handling ] ██
fishing_minigame_timed_event_handler:
    debug: false
    type: world
    events:
        on delta time minutely every:5:
            - run fishing_minigame_generate_whirlpools def:<server.flag[fishing_minigame_active_whirlpool_amount]>
            - foreach <server.online_players_flagged[fishingminigame.active]> as:player:
                - if <[player].flag[fishingminigame.active]>:
                    - narrate "<&7>The whirlpools have moved, you might need to find a new spot to fish" targets:<[player]>
        on system time 00:00:
            - run fishing_minigame_reset_leaderboards

# % ██ [ Minigame Event Handling ] ██
fishing_minigame_event_handler:
    debug: true
    type: world
    events:
        # % ██ [ Player Catch Fish ] ██
        on player fishes while caught_fish:
            - if <player.has_flag[fishingminigame.active]> && <player.flag[fishingminigame.active]>:
                - define randomFish <proc[fishing_minigame_get_random_fish]>
                - if <proc[fishing_minigame_location_in_whirlpool].context[<context.hook.location>]>:
                    - if !<proc[fishing_minigame_bucket_full].context[<player>]>:
                        - run fishing_minigame_bucket_add def:<player>|<[randomFish]>
                        - remove <context.hook>
                        - determine cancelled
                    - else:
                        - title "title:<&c>Bucket Full!" "subtitle:<&c>Go sell your fish before you catch more!" targets:<player>
                        - narrate "<&c>The fish slipped out of your hands, because you had nowhere to put it! Go sell your fish at the fish merchant before you continue!"
                        - remove <context.hook>
                        - determine cancelled
                - else:
                    - narrate "<&c>There are no fish here, make sure you're fishing in a whirlpool!"
                    - remove <context.hook>
                    - determine cancelled

        on player fishes while caught_entity:
            - if <player.has_flag[fishingminigame.active]> && <player.flag[fishingminigame.active]>:
                - remove <context.hook>

        after player fishes while fishing:
            - if <player.has_flag[fishingminigame.active]> && <player.flag[fishingminigame.active]>:
                - while !<context.hook.fish_hook_state.equals[bobbing]>:
                    - wait 3s
                - if <context.hook.is_spawned>:
                    - if !<proc[fishing_minigame_location_in_whirlpool].context[<context.hook.location>]>:
                        - narrate "<&c>Make sure you're fishing in a whirlpool to catch fish!"
                    - if <proc[fishing_minigame_bucket_full].context[<player>]>:
                        - title "title:<&c>Bucket Full!" "subtitle:<&c>Go sell your fish before you catch more!" targets:<player>

        # % ██ [ Generates and stores a list of valid whirlpool locations ] ██
        after server start:
            - wait 5s
            - run fishing_minigame_reset_whirlpools
            - run fishing_minigame_reset_whirlpool_locations
            - run fishing_minigame_generate_whirlpools def:<server.flag[fishing_minigame_active_whirlpool_amount]>
            - if !<server.has_flag[fishingminigame.bestcatch.fish]>:
                - flag server fishingminigame.bestcatch.fish:none
                - flag server fishingminigame.bestcatch.player:none

        # % ██ [ Player Interact with Merchant ] ██
        on player clicks in fishing_minigame_merchant_gui:
            - if !<context.item.material.name.equals[air]> && <context.item.script.name.exists>:
                - choose <context.item.script.name>:
                    - case fishing_minigame_start_button:
                        - inventory close
                        - run fishing_minigame_start def:<player>
                    - case fishing_minigame_fishtokens_button:
                        - inventory close
                        - run fishing_minigame_shop_open_gui def:<player>
                    - case fishing_minigame_leaderboards_button:
                        - inventory close
                        - run fishing_minigame_leaderboards_open_gui def:<player>
                    - case fishing_minigame_fish_button:
                        - inventory close
                        - run fishing_minigame_open_bucket def:<player>|true
                    - case fishing_minigame_end_game:
                        - inventory close
                        - run fishing_minigame_stop def:<player>

        # % ██ [ Player Interact with Shop ] ██
        on player clicks in fishing_minigame_shop_gui:
            - if !<context.item.material.name.equals[air]> && <context.item.script.name.exists>:
                - choose <context.item.script.name>:
                    - case fishing_minigame_shop_exchange_item:
                        - inventory close
                        - narrate "<&c>Unavailable during the beta"
                    - case fishing_minigame_shop_skins_item:
                        - inventory close
                        - narrate "<&c>Unavailable during the beta"
                    - case fishing_minigame_shop_music_item:
                        - inventory close
                        - run fishing_minigame_music_shop_open_gui def:<player>
                    - case fishing_minigame_shop_bucket_item:
                        - inventory close
                        - narrate "<&c>Unavailable during the beta"

        # % ██ [ Player Interact with MP3 Player ] ██
        on player clicks in fishing_minigame_mp3_gui:
            - if <player.has_flag[fishingminigame.active]> && <player.flag[fishingminigame.active]>:
                - define song <context.item>
                - if <[song].material.name.equals[music_disc_pigstep]>:
                    - if <player.has_flag[fishing_minigame_playing_music]>:
                        - queue <player.flag[fishing_minigame_music_queue]> stop
                        - midi cancel
                        - flag <player> fishing_minigame_playing_music:!
                    - actionbar "<&b>Now playing <[song].display.strip_color>" targets:<player>
                    - inventory close
                    - flag <player> fishing_minigame_playing_music
                    - flag <player> fishing_minigame_last_song:<[song].display.strip_color>
                    - wait 10t
                    - run fishing_minigame_play_song def:<player>|<[song].flag[fileName]> save:queue
                    - flag <player> fishing_minigame_music_queue:<entry[queue].created_queue>
                - else if <[song].material.name.equals[note_block]>:
                    - if <player.has_flag[fishing_minigame_playing_music]>:
                        - queue <player.flag[fishing_minigame_music_queue]> stop
                        - midi cancel
                        - flag <player> fishing_minigame_playing_music:!
                        - inventory close
                        - run fishing_minigame_mp3_open_gui def:<player>

        # % ██ [ Player Interact with Music Shop ] ██
        on player clicks in fishing_minigame_music_shop_gui:
            - define song <context.item>
            - if <[song].material.name.equals[music_disc_pigstep]>:
                - if !<[song].is_enchanted>:
                    - run fish_tokens_remove def:<player>|1000 save:removed
                    - if <entry[removed].created_queue.determination.first>:
                        - define songName <[song].flag[songName]>
                        - flag <player> fishingminigame.music:<player.flag[fishingminigame.music].include[<[songName]>]>
                        - narrate "<&a><[songName]> has been added to your MP3 Player!"
                        - inventory close
                        - run fishing_minigame_music_shop_open_gui def:<player>
                    - else:
                        - narrate "<&c>You can not afford that!"

        # % ██ [ Player Interact with Bucket ] ██
        on player clicks in fishing_minigame_bucket_gui:
            - if <context.item.has_flag[type]>:
                - if <context.click.equals[LEFT]>:
                    - define fish <context.item>
                    - while <[fish].lore.size> > 6:
                        - adjust def:fish lore:<[fish].lore.remove[last]>
                    - run fishing_minigame_bucket_remove def:<player>|<[fish]>
                    - if "<context.inventory.title.strip_color.equals[Sell Fish]>":
                        - run fishing_minigame_open_bucket def:<player>|true
                        - run fish_tokens_add def:<player>|<proc[fishing_minigame_fish_value].context[<[fish]>]>
                    - else:
                        - run fishing_minigame_open_bucket def:<player>|false
                - else if <context.click.equals[RIGHT]>:
                    - define fish <context.item>
                    - while <[fish].lore.size> > 6:
                        - adjust def:fish lore:<[fish].lore.remove[last]>
                    - inventory close
                    - run fishing_minigame_show_off def:<player>|<[fish]>
            - if <context.item.script.name.equals[fishing_minigame_sell_all]>:
                - run fishing_minigame_sell_all_fish def:<player>
                - run fishing_minigame_open_bucket def:<player>|true

        # % ██ [ Right click end fishing ] ██
        on player right clicks block with:fishing_minigame_end_game:
            - if <player.has_flag[fishingminigame.active]> && <player.flag[fishingminigame.active]>:
                - run fishing_minigame_stop def:<player>
                - determine cancelled

         # % ██ [ Right click handler ] ██
        on player right clicks block:
            - if <player.has_flag[fishingminigame.active]> && <player.flag[fishingminigame.active]>:
                - if <context.item.script.data_key[data.flag].exists> && <context.item.script.data_key[data.flag].equals[bucket]>:
                    - run fishing_minigame_open_bucket def:<player>|false
                    - determine cancelled
                - if <context.item.script.data_key[data.flag].exists> && <context.item.script.data_key[data.flag].equals[statbook]>:
                    - run fishing_minigame_stats_book_open def:<player>
                    - determine cancelled
                - if <context.item.script.data_key[data.flag].exists> && <context.item.script.data_key[data.flag].equals[mp3]>:
                    - run fishing_minigame_mp3_open_gui def:<player>
                    - determine cancelled

        # % ██ [ Bunch of events to prevent unwanted actions ] ██
        on player picks up item:
            - if <player.has_flag[fishingminigame.active]> && <player.flag[fishingminigame.active]>:
                - if !<context.item.has_flag[type]>:
                    - determine cancelled
        on player drops item:
            - if <player.has_flag[fishingminigame.active]> && <player.flag[fishingminigame.active]>:
                - if !<context.item.has_flag[type]>:
                    - determine cancelled
        on player clicks item in inventory:
            - if <player.has_flag[fishingminigame.active]> && <player.flag[fishingminigame.active]>:
                - if !<context.item.material.name.equals[air]> && <context.item.script.name.exists>:
                    - if <context.item.script.name.equals[fishing_minigame_fish_bucket]> || <context.item.script.name.equals[fishing_minigame_fish_bucket_empty]> || <context.item.script.name.equals[fishing_minigame_fish_bucket_full]>:
                        - determine cancelled passively
                        - run fishing_minigame_open_bucket def:<player>|false
                    - else if <context.item.script.name.equals[fishing_minigame_statistics_book_inv]>:
                        - run fishing_minigame_stats_book_open def:<player>
                        - determine cancelled
                    - else if <context.item.script.name.equals[fishing_minigame_end_game]>:
                        - inventory close
                        - run fishing_minigame_stop def:<player>
                    - else if <context.item.script.data_key[data.flag].exists> && <context.item.script.data_key[data.flag].equals[mp3]>:
                        - inventory close
                        - run fishing_minigame_mp3_open_gui def:<player>
                    - determine cancelled
        on player opens inventory:
            - if <player.has_flag[fishingminigame.active]> && <player.flag[fishingminigame.active]>:
                - adjust <player> item_on_cursor:<item[air]>
        on player drags in inventory:
            - if <player.has_flag[fishingminigame.active]> && <player.flag[fishingminigame.active]>:
                - determine cancelled
        on player swaps items:
            - if <player.has_flag[fishingminigame.active]> && <player.flag[fishingminigame.active]>:
                - determine cancelled
        on player breaks block:
            - if <player.has_flag[fishingminigame.active]> && <player.flag[fishingminigame.active]>:
                - determine cancelled
        on player places block:
            - if <player.has_flag[fishingminigame.active]> && <player.flag[fishingminigame.active]>:
                - determine cancelled
        on command:
            - if <context.source_type.equals[PLAYER]>:
                - if <player.has_flag[fishingminigame.active]> && <player.flag[fishingminigame.active]>:
                    - run fishing_minigame_stop def:<player>
        on player right clicks entity:
            - if <player.has_flag[fishingminigame.active]> && <player.flag[fishingminigame.active]>:
                - if <context.entity.is_npc>:
                    - if !<context.entity.scripts.parse[name].contains[fishing_minigame_merchant_npc]>:
                        - run fishing_minigame_stop def:<player>
        on player joins:
            - if !<player.has_flag[fishingminigame.music]>:
                - flag <player> fishingminigame.music:<list[]>
        on player quits:
            - if <player.has_flag[fishing_minigame_playing_music]>:
                - queue <player.flag[fishing_minigame_music_queue]> stop
                - midi cancel
                - flag <player> fishing_minigame_playing_music:!

# % ██ [ Minigame Merchant Handling ] ██
fishing_minigame_merchant_npc:
    debug: false
    type: assignment
    actions:
        on assignment:
            - trigger name:click state:true
        on click:
            - run fishing_minigame_merchant_open_gui def:<player>

#- % █████████████████████████████████
#- %          [ Inventories ]
#- % █████████████████████████████████

fishing_minigame_merchant_open_gui:
    type: task
    definitions: player
    debug: false
    build_inventory:
        - define inventory <inventory[fishing_minigame_merchant_gui]>
        - if <[player].has_flag[fishingminigame.active]> && <[player].flag[fishingminigame.active]>:
            - inventory set o:fishing_minigame_end_game slot:14 d:<[inventory]>
        - else:
            - inventory set o:fishing_minigame_start_button slot:14 d:<[inventory]>
        - define tokensButton <item[fishing_minigame_fishtokens_button]>
        - define tokensLore <[tokensButton].lore>
        - if <[player].has_flag[fishingminigame.fishtokens]>:
            - define newLoreLine "<&a>Fishtokens Amount: <[player].flag[fishingminigame.fishtokens].round_to[2].format_number> <&r><&font[adriftus:chat]><&chr[0045]>"
        - else:
            - define newLoreLine "<&a>Fishtokens Amount: 0 <&r><&font[adriftus:chat]><&chr[0045]>"
        - define tokensLore <[tokensLore].set_single[<[newLoreLine]>].at[3]>
        - adjust def:tokensButton lore:<[tokensLore]>
        - inventory set o:<[tokensButton]> slot:30 d:<[inventory]>
        - inventory set o:fishing_minigame_leaderboards_button slot:32 d:<[inventory]>
        - inventory set o:fishing_minigame_fish_button slot:34 d:<[inventory]>
    script:
        - inject locally path:build_inventory
        - inventory open d:<[inventory]>

fishing_minigame_merchant_gui:
    type: inventory
    inventory: chest
    size: 45
    debug: false
    title: <&b>Fishing Merchant
    gui: true

fishing_minigame_shop_open_gui:
    type: task
    definitions: player
    debug: false
    build_inventory:
        - define inventory <inventory[fishing_minigame_shop_gui]>
    script:
        - inject locally path:build_inventory
        - inventory open d:<[inventory]>

fishing_minigame_shop_gui:
    type: inventory
    inventory: chest
    size: 27
    debug: false
    title: <&b>Shop
    gui: true
    slots:
    - [] [] [] [] [] [] [] [] []
    - [] [fishing_minigame_shop_exchange_item] [] [fishing_minigame_shop_skins_item] [] [fishing_minigame_shop_music_item] [] [fishing_minigame_shop_bucket_item] []
    - [] [] [] [] [] [] [] [] []

fishing_minigame_bucket_open_gui:
    type: task
    definitions: player|merchant
    build_inventory:
        - define inventory <inventory[fishing_minigame_bucket_gui]>
        - define bucketSlots <list[12|13|14|15|16|21|22|23|24|25|30|31|32|33|34|39|40|41|42|43]>
        - define fishes <[player].flag[fishingminigame.bucket.fish]>
        - foreach <[fishes]> as:fish:
            - define fishCopy <item[<[fish]>]>
            - if <[merchant]>:
                - define fishLore "<[fish].lore.include[<&r><&b>Value: <&r><&b><proc[fishing_minigame_fish_value].context[<[fish]>].round_to[2].format_number> <&font[adriftus:chat]><&chr[0045]>]>"
                - define fishLore <[fishLore].include[<&r>]>
                - define fishLore "<[fishLore].include[<&r><element[➤ Click to Sell].color_gradient[from=#62FF00;to=#CBFFB9]>]>"
            - else:
                - define fishLore "<[fish].lore.include[<&r><element[➤ Left Click to Trash].color_gradient[from=#FF2929;to=#FF9292]>]>"
                - define fishLore "<[fishLore].include[<&r><element[➤ Right Click to Show Off in Chat].color_gradient[from=#FF8400;to=#FFC481]>]>"
            - adjust def:fishCopy lore:<[fishLore]>
            - inventory set o:<[fishCopy]> slot:<[bucketSlots].first> d:<[inventory]>
            - define bucketSlots <[bucketSlots].remove[first]>
        - if <[merchant]>:
            - adjust def:inventory "title:<&e>Sell Fish"
            - inventory set o:fishing_minigame_sell_all slot:50 d:<[inventory]>
    script:
        - inject locally path:build_inventory
        - inventory open d:<[inventory]>

fishing_minigame_bucket_gui:
    type: inventory
    inventory: chest
    size: 54
    title: <&e>Bucket
    gui: true
    debug: false
    definitions:
        black: <item[black_stained_glass_pane[display=<&r> ]]>
        white: <item[white_stained_glass_pane[display=<&r> ]]>
        red: <item[red_stained_glass_pane[display=<&r> ]]>
        blue: <item[light_blue_stained_glass_pane[display=<&r> ]]>
    slots:
    - [black] [white] [blue] [blue] [blue] [blue] [blue] [white] [black]
    - [black] [white] [] [] [] [] [] [white] [black]
    - [black] [white] [] [] [] [] [] [white] [black]
    - [black] [white] [] [] [] [] [] [white] [black]
    - [black] [white] [] [] [] [] [] [white] [black]
    - [black] [black] [white] [white] [white] [white] [white] [black] [black]

fishing_minigame_leaderboards_open_gui:
    type: task
    definitions: player
    debug: false
    build_inventory:
        - define inventory <inventory[fishing_minigame_leaderboards_gui]>
        - define slots <list[20|30|40|26|34|42]>
        - define colors <list[e|7|6]>
        - define gradients <list[from=#FFEA00;to=#FFF873|from=#A7A7A7;to=#E6E6E6|from=#F08800;to=#FFA057]>
        - define bestCatch <server.flag[fishingminigame.bestcatch.fish]>
        - define bestCatchPlayer <server.flag[fishingminigame.bestcatch.player]>
        - define mostCatchedPlayers <proc[fishing_minigame_top_catchers_daily]>
        - define mostValuePlayers <proc[fishing_minigame_top_value_daily]>

        - define barrier <item[barrier]>
        - adjust def:barrier display:<&c><&l>Empty
        - adjust def:barrier "lore:<&7>This spot is open! Start fishing to claim it!"

        - if <[bestCatch].equals[none]>:
            - inventory set o:<item[player_head[display=<&7><&l>Nobody]]> slot:5 d:<[inventory]>
            - inventory set o:<[barrier]> slot:14 d:<[inventory]>
        - else:
            - define playerName <player[<[bestCatchPlayer]>].name>
            - define playerHead <item[player_head[skull_skin=<[playerName]>]]>
            - adjust def:playerHead "display:<&d><&l>Best Catch"
            - adjust def:playerHead "lore:<&7>Best catch of the day by:<n><&d><player[<[bestCatchPlayer]>].name.color_gradient[from=#FF62FA;to=#FFA8EF]>"
            - inventory set o:<[playerHead]> slot:5 d:<[inventory]>
            - inventory set o:<[bestCatch].unescaped> slot:14 d:<[inventory]>

        - repeat 3:
            - if <[mostCatchedPlayers].get[<[value]>].exists>:
                - define playerName <[mostCatchedPlayers].get[<[value]>].name>
                - define playerHead <item[player_head[skull_skin=<[playerName]>]]>
                - adjust def:playerHead display:<element[<&ns><[value]>].color[<[colors].get[<[value]>]>]>
                - adjust def:playerHead "lore:<&l><element[<bold><[playerName]>].color_gradient[<[gradients].get[<[value]>]>]><n><&8>+---------------+<n><&7>Fish caught: <&a><[mostCatchedPlayers].get[<[value]>].flag[fishingminigame.stats.daily.catch]><n><&8>+---------------+"
                - inventory set o:<[playerHead]> slot:<[slots].first> d:<[inventory]>
                - define slots <[slots].remove[first]>
            - else:
                - inventory set o:<[barrier]> slot:<[slots].first> d:<[inventory]>
                - define slots <[slots].remove[first]>

        - repeat 3:
            - if <[mostValuePlayers].get[<[value]>].exists>:
                - define playerName <[mostValuePlayers].get[<[value]>].name>
                - define playerHead <item[player_head[skull_skin=<[playerName]>]]>
                - adjust def:playerHead display:<element[<&ns><[value]>].color[<[colors].get[<[value]>]>]>
                - adjust def:playerHead "lore:<&l><element[<bold><[playerName]>].color_gradient[<[gradients].get[<[value]>]>]><n><&8>+---------------+<n><&7>Value caught: <&a><[mostValuePlayers].get[<[value]>].flag[fishingminigame.stats.daily.value].round_to[2].format_number> <&r><&font[adriftus:chat]><&chr[0045]><n><&8>+---------------+"
                - inventory set o:<[playerHead]> slot:<[slots].first> d:<[inventory]>
                - define slots <[slots].remove[first]>
            - else:
                - inventory set o:<[barrier]> slot:<[slots].first> d:<[inventory]>
                - define slots <[slots].remove[first]>
    script:
        - inject locally path:build_inventory
        - inventory open d:<[inventory]>

fishing_minigame_leaderboards_gui:
    type: inventory
    inventory: chest
    size: 54
    debug: false
    title: <&d>Leaderboards
    gui: true
    definitions:
        green: <item[lime_stained_glass_pane[display=<&r> ]]>
        gold: <item[yellow_stained_glass_pane[display=<&r> ]]>
        silver: <item[gray_stained_glass_pane[display=<&r> ]]>
        bronze: <item[orange_stained_glass_pane[display=<&r> ]]>
    slots:
    - [] [] [green] [green] [] [green] [green] [] []
    - [] [] [] [green] [] [green] [] [] []
    - [] [] [] [] [green] [] [] [] []
    - [] [gold] [] [] [] [] [] [gold] []
    - [] [gold] [silver] [] [] [] [silver] [gold] []
    - [] [gold] [silver] [bronze] [] [bronze] [silver] [gold] []

fishing_minigame_mp3_open_gui:
    type: task
    definitions: player
    debug: false
    build_inventory:
        - define inventory <inventory[fishing_minigame_mp3_gui]>
        - define music <proc[fishing_minigame_get_all_music_tracks]>
        - define ownedTracks <[player].flag[fishingminigame.music]>

        - if <[player].has_flag[fishing_minigame_playing_music]>:
            - define noteblock <item[fishing_minigame_mp3_stop_button]>
            - adjust def:noteblock "lore:<&7>Currently Playing:<n><&a><[player].flag[fishing_minigame_last_song]><n><&r><n><&r><element[➤ Press to Interrupt].color_gradient[from=#FF2929;to=#FF9292]>"
            - inventory set o:<[noteblock]> slot:50 d:<[inventory]>
        - else:
            - define noteblock <item[fishing_minigame_mp3_no_button]>
            - inventory set o:<[noteblock]> slot:50 d:<[inventory]>

        - foreach <[ownedTracks]> as:track:
            - define trackName <[track].replace[_].with[<&sp>]>
            - define item <item[music_disc_pigstep[hides=all]]>
            - adjust def:item display:<&6><&l><[trackName]>
            - adjust def:item "lore:<&7>By: <[music].get[<[track]>].get[author].replace[_].with[<&sp>]>"
            - adjust def:item flag:fileName:<[music].get[<[track]>].get[filename]>
            - inventory set o:<[item]> slot:<[inventory].first_empty> d:<[inventory]>
    script:
        - inject locally path:build_inventory
        - inventory open d:<[inventory]>

fishing_minigame_mp3_gui:
    type: inventory
    inventory: chest
    size: 54
    debug: false
    title: <&6>MP3 Player
    gui: true
    definitions:
        gold: <item[orange_stained_glass_pane[display=<&r> ]]>
    slots:
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [gold] [gold] [gold] [gold] [] [gold] [gold] [gold] [gold]

fishing_minigame_music_shop_open_gui:
    type: task
    definitions: player
    debug: false
    build_inventory:
        - define inventory <inventory[fishing_minigame_music_shop_gui]>
        - define music <proc[fishing_minigame_get_all_music_tracks]>
        - define ownedTracks <[player].flag[fishingminigame.music]>

        - foreach <[music]> key:track as:map:
            - define trackName <[track].replace[_].with[<&sp>]>
            - define item <item[music_disc_pigstep[hides=all]]>
            - adjust def:item display:<&6><&l><[trackName]>
            - if <[ownedTracks].contains[<[track]>]>:
                - adjust def:item enchantments:empty=1
                - adjust def:item "lore:<&7>By: <[map].get[author].replace[_].with[<&sp>]><n><&r><n><&r><element[You own this song].color_gradient[from=#FF8400;to=#FFC481]>"
            - else:
                - adjust def:item "lore:<&7>By: <[map].get[author].replace[_].with[<&sp>]><n><&7>Price: <&b>1000<&r><&font[adriftus:chat]><&chr[0045]><&r><n><&r><n><&r><element[➤ Press to Purchase].color_gradient[from=#FF8400;to=#FFC481]>"
            - adjust def:item flag:fileName:<[map].get[filename]>
            - adjust def:item flag:songName:<[track]>
            - inventory set o:<[item]> slot:<[inventory].first_empty> d:<[inventory]>
    script:
        - inject locally path:build_inventory
        - inventory open d:<[inventory]>

fishing_minigame_music_shop_gui:
    type: inventory
    inventory: chest
    size: 45
    debug: false
    title: <&6>Music Shop
    gui: true
    slots:
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []

#- % █████████████████████████████████
#- %             [ Items ]
#- % █████████████████████████████████

# % ██ [ Fishing Loot Table ] ██
fishing_minigame_fish_table:
    debug: false
    type: data
    rarity:
        common:
            color: <&f><&l>
            multi: 0.1
        uncommon:
            color: <&a><&l>
            multi: 0.25
        rare:
            color: <&b><&l>
            multi: 0.5
        epic:
            color: <&d><&l>
            multi: 0.75
        legendary:
            color: <&6><&l>
            multi: 1
    quality:
        shit:
            weight: 100
            color: <color[#d2691e]>
            multi: 0.01
        bad:
            weight: 99
            color: <color[#D61F1F]>
            multi: 0.5
        okay:
            weight: 60
            color: <color[#ff5f56]>
            multi: 0.75
        good:
            weight: 40
            color: <color[#FFD301]>
            multi: 1
        great:
            weight: 20
            color: <color[#7BB662]>
            multi: 1.5
        amazing:
            weight: 10
            color: <color[#00FF00]>
            multi: 2
    fish:
        common:
            weight: 100
            flounder:
                minWeight: 0.5
                maxWeight: 15
                minSize: 8.7
                maxSize: 23.6
                valueMulti: 0.05
            bass:
                minWeight: 0.5
                maxWeight: 8
                minSize: 10
                maxSize: 25
                valueMulti: 0.1
            minnow:
                minWeight: 0.5
                maxWeight: 2
                minSize: 1.5
                maxSize: 4
                valueMulti: 1
            shrimp:
                minWeight: 0.1
                maxWeight: 1
                minSize: 0.8
                maxSize: 10
                valueMulti: 0.5
            herring:
                minWeight: 0.5
                maxWeight: 2.5
                minSize: 25
                maxSize: 45
                valueMulti: 0.1
        uncommon:
            weight: 20
            tuna:
                minWeight: 3
                maxWeight: 1500
                minSize: 18
                maxSize: 180
                valueMulti: 0.002
            cod:
                minWeight: 10
                maxWeight: 300
                minSize: 40
                maxSize: 80
                valueMulti: 0.01
            trout:
                minWeight: 0.5
                maxWeight: 10
                minSize: 8
                maxSize: 28
                valueMulti: 0.35
            mackerel:
                minWeight: 1
                maxWeight: 8
                minSize: 8
                maxSize: 26
                valueMulti: 0.6
            catfish:
                minWeight: 1
                maxWeight: 200
                minSize: 1
                maxSize: 62
                valueMulti: 0.08
        rare:
            weight: 10
            salmon:
                minWeight: 15
                maxWeight: 140
                minSize: 18
                maxSize: 60
                valueMulti: 0.13
            snapper:
                minWeight: 1
                maxWeight: 50
                minSize: 5
                maxSize: 40
                valueMulti: 0.3
            carp:
                minWeight: 5
                maxWeight: 110
                minSize: 10
                maxSize: 48
                valueMulti: 0.1
            perch:
                minWeight: 0.5
                maxWeight: 5
                minSize: 5
                maxSize: 20
                valueMulti: 4
        epic:
            weight: 4
            halibut:
                minWeight: 2.2
                maxWeight: 570
                minSize: 18
                maxSize: 100
                valueMulti: 0.01
            mahimahi:
                minWeight: 12
                maxWeight: 40
                minSize: 5
                maxSize: 30
                valueMulti: 0.3
            sturgeon:
                minWeight: 50
                maxWeight: 3500
                minSize: 24
                maxSize: 288
                valueMulti: 0.001
            stingray:
                minWeight: 500
                maxWeight: 800
                minSize: 72
                maxSize: 96
                valueMulti: 0.005
            swordfish:
                minWeight: 80
                maxWeight: 1430
                minSize: 96
                maxSize: 180
                valueMulti: 0.005
        legendary:
            weight: 1
            sawfish:
                minWeight: 1000
                maxWeight: 1500
                minSize: 276
                maxSize: 300
                valueMulti: 0.005
            anglerfish:
                minWeight: 15
                maxWeight: 70
                minSize: 9
                maxSize: 40
                valueMulti: 1
            shark:
                minWeight: 0.5
                maxWeight: 5000
                minSize: 8
                maxSize: 552
                valueMulti: 0.005
            moonfish:
                minWeight: 10
                maxWeight: 600
                minSize: 20
                maxSize: 72
                valueMulti: 0.1

# % ██ [ Fishing Rod ] ██
fishing_minigame_bad_rod:
    debug: false
    type: item
    material: fishing_rod
    mechanisms:
      unbreakable: true
    display name: <&a><&l>Fishing Rod
    lore:
    - <&7>Your basic fishing rod.
    - <&7>Use this to catch fish (duh).

# % ██ [ Fishing Tokens Wallet ] ██
fishing_minigame_fishtoken_item:
    debug: false
    type: item
    material: iron_nugget
    display name: <&d><&l>0 Fishtokens
    mechanisms:
        custom_model_data: 40
    lore:
    - <&7>Your fishtoken wallet.
    - <&7>This will display your fishtoken balance.

# % ██ [ Shop Excahnge item ] ██
fishing_minigame_shop_exchange_item:
    debug: false
    type: item
    material: iron_nugget
    display name: <&b><&l>5,000<&r><&font[adriftus:chat]><&chr[0045]><&r> <&b><&l>-<&gt> $10
    mechanisms:
        custom_model_data: 40
    lore:
    - <&7>Exchange your fish tokens
    - <&7>to gain some currency
    - <&7>for the server.
    - <&r>
    - <&r><element[➤ Click to Exchange].color_gradient[from=#00DDFF;to=#A6F8FF]>

# % ██ [ Shop fishing skins item ] ██
fishing_minigame_shop_skins_item:
    debug: false
    type: item
    material: fishing_rod
    display name: <&b><&l>Fishing Rod Skins
    lore:
    - <&7>Purchase fishing rod skins here!
    - <&7>This is how you can show off
    - <&7>your riches to your fellow
    - <&7>fishermen!
    - <&r>
    - <&r><element[➤ Click to View Options].color_gradient[from=#00DDFF;to=#A6F8FF]>

# % ██ [ Shop music item ] ██
fishing_minigame_shop_music_item:
    debug: false
    type: item
    material: jukebox
    display name: <&b><&l>Music
    lore:
    - <&7>Purchase music here!
    - <&7>After purchase, slap the disc
    - <&7>in your mp3 player, and listen
    - <&7>to jams while fishing!
    - <&r>
    - <&r><element[➤ Click to View Options].color_gradient[from=#00DDFF;to=#A6F8FF]>

# % ██ [ Shop music item ] ██
fishing_minigame_shop_bucket_item:
    debug: false
    type: item
    material: water_bucket
    display name: <&b><&l>Bucket Upgrades
    lore:
    - <&7>Purchase bucket upgrades here!
    - <&7>These will allow you to carry
    - <&7>more fish around, without having
    - <&7>to contantly sell!
    - <&r>
    - <&r><element[➤ Click to Upgrade].color_gradient[from=#00DDFF;to=#A6F8FF]>

# % ██ [ End Game ] ██
fishing_minigame_end_game:
    debug: false
    type: item
    material: barrier
    display name: <&c><&l>Finish Fishing
    lore:
    - <&7>This will stop the fishing minigame.
    - <&7>and return you back to normal.
    - <&r>
    - <&r><element[➤ Click to End].color_gradient[from=#FF2929;to=#FF9292]>

# % ██ [ Fish Bucket Empty ] ██
fishing_minigame_fish_bucket_empty:
    debug: false
    type: item
    material: water_bucket
    display name: <&e><&l>Empty Bucket
    data:
        flag: bucket
    lore:
    - <&7>Your fish storage.
    - <&7>Currently empty, what are you waiting for?
    - <&r>
    - <&r><element[➤ Click to View].color_gradient[from=#FFF95B;to=#FFFCB0]>

# % ██ [ Fish Bucket ] ██
fishing_minigame_fish_bucket:
    debug: false
    type: item
    material: tropical_fish_bucket
    display name: <&e><&l>Fish Bucket
    data:
        flag: bucket
    lore:
    - <&7>Your fish storage.
    - <&r>
    - <&r><element[➤ Click to View].color_gradient[from=#FFF95B;to=#FFFCB0]>

# % ██ [ Fish Bucket Empty ] ██
fishing_minigame_fish_bucket_full:
    debug: false
    type: item
    material: pufferfish_bucket
    display name: <&e><&l>Fish Bucket <&c><&l>[FULL]
    data:
        flag: bucket
    lore:
    - <&7>Your fish storage.
    - <&7>The bucket is full! Sell your fish at the merchant
    - <&r>
    - <&r><element[➤ Click to View].color_gradient[from=#FFF95B;to=#FFFCB0]>

# % ██ [ Fish bucket sell all ] ██
fishing_minigame_sell_all:
    debug: false
    type: item
    material: barrier
    display name: <&c><&l>Sell All
    lore:
    - <&7>This will sell all the fish in your bucket.
    - <&r>
    - <&r><element[➤ Click to Sell All].color_gradient[from=#FF2929;to=#FF9292]>

# % ██ [ Fish Bucket ] ██
fishing_minigame_statistics_book_inv:
    debug: false
    type: item
    material: book
    display name: <&b><&l>Statistics
    data:
        flag: statbook
    lore:
    - <&7>Your all time statistics.
    - <&r>
    - <&r><element[➤ Click to View].color_gradient[from=#00DDFF;to=#A6F8FF]>

# % ██ [ MP3 Player ] ██
fishing_minigame_mp3_player:
    debug: false
    type: item
    material: jukebox
    display name: <&6><&l>MP3 Player
    data:
        flag: mp3
    lore:
    - <&7>Play your music!
    - <&7>Purchase more songs at the
    - <&7>fishing merchant
    - <&r>
    - <&r><element[➤ Click to Open].color_gradient[from=#FF8400;to=#FFC481]>

# % ██ [ Start Minigame Button ] ██
fishing_minigame_start_button:
    debug: false
    type: item
    material: fishing_rod
    display name: <&b><&l>Start fishing!
    lore:
    - <&7>You ready to begin your fishing journey?
    - <&r>
    - <&r><element[➤ Click to Start Minigame].color_gradient[from=#6DD5FA;to=#FFFFFF]>

# % ██ [ Fishtokens Button ] ██
fishing_minigame_fishtokens_button:
    debug: false
    type: item
    material: iron_nugget
    display name: <&a><&l>Fishtoken Shop
    mechanisms:
        custom_model_data: 40
    lore:
    - <&7>This is your fishing currency.
    - <&r>
    - <&a>Fishtokens Amount: 0
    - <&r>
    - <&r><element[➤ Fishtoken Shop].color_gradient[from=#62FF00;to=#CBFFB9]>

# % ██ [ Leaderboards Button ] ██
fishing_minigame_leaderboards_button:
    debug: false
    type: item
    material: writable_book
    display name: <&d><&l>Leaderboards
    lore:
    - <&7>View who is leading todays competition.
    - <&r>
    - <&r><element[➤ View Leaderboards].color_gradient[from=#FF34EE;to=#FFC4F4]>

# % ██ [ Sell Fish Button ] ██
fishing_minigame_fish_button:
    debug: false
    type: item
    material: tropical_fish_bucket
    display name: <&e><&l>Sell Fish
    lore:
    - <&7>Get your catch valued by the merchant.
    - <&r>
    - <&r><element[➤ View Your Value].color_gradient[from=#FFF95B;to=#FFFCB0]>

# % ██ [ MP3 No Song ] ██
fishing_minigame_mp3_no_button:
    debug: false
    type: item
    material: note_block
    display name: <&c><&l>Nothing Playing
    data:
        flag: mp3_no
    lore:
    - <&7>Currently nothing is playing
    - <&7>Select a track to listen to

# % ██ [ MP3 Stop Song ] ██
fishing_minigame_mp3_stop_button:
    debug: false
    type: item
    material: note_block
    display name: <&c><&l>Stop
    data:
        flag: mp3_stop
    enchantments:
    - empty:1
    lore:
    - <&7>Currently Playing <&a>Song
    - <&r>
    - <&r><element[➤ Press to Interrupt].color_gradient[from=#FF2929;to=#FF9292]>

# % ██ [ Statistics Book ] ██
fishing_minigame_stats_book:
    debug: false
    type: book
    title: Stats
    author: Fishing Merchant
    text:
    - Something went wrong