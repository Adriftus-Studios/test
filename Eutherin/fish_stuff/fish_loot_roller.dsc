fishbot_loot_calculator:
  type: task
  debug: false
  definitions: user|area|catch_amount|bait|boat|rod|rod_broke|attack|channel
  script:
  - define config <script[fishbot_data_storage]>
  - define fish_area area.<[area]>

  #- build total catch amount
  - define rod_modifier <[config].data_key[rod.<[rod]>.catch_increase]||0>
  - define bait_modifier <[config].data_key[bait.<[bait]>.increase_percent]||0>
  - define boat_modifier <[config].data_key[boat.<[boat]>.catch_increase]||0>
  - define donor_modifier <server.flag[fishbot.donor_modifier]||0>
  - define event_modifier <server.flag[fishbot.event_modifier]||0>
  - define catch_modifier <element[0].add[<[boat_modifier]||0>].add[<[bait_modifier]||0>].add[<[rod_modifier]||0>].add[<[donor_modifier]||0>].add[<[event_modifier]||0>]>
  - define catch_amount <[catch_amount].mul[<element[1].add[<[catch_modifier]>]>]>
  - if <[attack]> == success:
    - define catch_amount <[catch_amount].mul[<[config].data_key[<[fish_area]>.attack_penalty]>].round_down>

  #- item catch chance modifiers
  - define bait_item_modifier <[config].data_key[bait.<[bait]>.item_chance]||0>
  - define rod_item_modifier <[config].data_key[rod.<[rod]>.item_chance]||0>
  - define event_item_modifier <server.flag[fishbot.event_item_modifier]||0>
  - define item_modifier <[bait_item_modifier].add[<[rod_item_modifier]>].add[<[bait_item_modifier]>]>



  #- legendary catch chance modifiers
  - define legendary_event_modifier <server.flag[fishbot.legendary_event_modifier]||0>
  - define legendary_modifier_bait <[config].data_key[bait.<[bait]>.legendary_chance]||0>
  - define legendary_modifier_rod <[config].data_key[rod.<[rod]>.legendary_catch]||0>
  - define legendary_modifier <[legendary_modifier_bait].add[<[legendary_event_modifier]>].add[<[legendary_modifier_rod]>]>
  - define legendary_chance <element[1000].sub[<[legendary_modifier]||0>]>


  #- roll for attacks and reduce if unarmored boat
  - if <[attack]> == succeed:
    - define catch_amount <[catch_amount].mul[<[config].data_key[<[fish_area]>.attack_penalty]>].round_down>


  #- retrieve loot chances
  - define item_chance <[config].data_key[<[fish_area]>.item_chance].add[<[item_modifier]>].mul[10]>
  - define event_key_chance <server.flag[fishbot.key_event_modifier]||0>
  - define key_chance <[config].data_key[<[fish_area]>.key_chance].add[<[event_key_chance]>]>
  - define rare_chance <[config].data_key[<[fish_area]>.rare_chance].mul[10]>
  - define trash_chance <[config].data_key[<[fish_area]>.trash_chance]>

  #- key modifiers per cast
  - define bait_key_chance <[config].data_key[bait.<[bait]>.key_chance]||0>
  - define rod_key_chance <[config].data_key[rod.<[rod]>.key_chance]||0>
  - define event_key_per_chance <server.flag[fishbot.key_per_event_modifier]||0>
  - define per_cast_key_chance <[bait_key_chance].add[<[rod_key_chance]>].add[<[event_key_per_chance]>]>


  #- roll for loot
  - if <util.random.int[1].to[100]> <= <[key_chance]>:
    - define drops:->:fishing_dungeon_key
  - if <[per_cast_key_chance]> > 0:
    - repeat <[catch_amount]>:
      - if <util.random.int[1].to[100]> <= <[per_cast_key_chance]>:
        - define drops:->:fishing_dungeon_key
  - repeat <[catch_amount]>:
    - wait 1t
    - define loot_roll <util.random.int[1].to[1000]>
    - if <[loot_roll]> < <[item_chance]>:
      - define item_roll <util.random.int[1].to[100]>
      - if <[item_roll]> > <[trash_chance]>:
        - define item <[config].list_keys[<[fish_area]>.good_items].random>
        - define experience:+:<[config].data_key[<[fish_area]>.good_items.<[item]>].if_null[1]>
        - define drops:->:<[item].parsed>
        - repeat next
      - define item <[config].list_keys[<[fish_area]>.trash_items].random>
      - define experience:+:<[config].data_key[<[fish_area]>.trash_items.<[item]>].if_null[1]>
      - define drops:->:<[item].parsed>
      - repeat next
    - if <[loot_roll]> >= <[legendary_chance]>:
      - define item <[config].list_keys[<[fish_area]>.legendary_fish].random>
      - define experience:+:<[config].data_key[fish.<[item]>.min_catch].mul[10]>
      - define drops:->:<[item]>
      - repeat next
    - if <[loot_roll]> < <[rare_chance].add[<[item_chance]>]>:
      - define item <[config].list_keys[<[fish_area]>.rare_fish].random>
      - define experience:+:<[config].data_key[fish.<[item]>.min_catch].mul[1.75]>
      - define drops:->:<[item]>
      - repeat next
    - define item <[config].list_keys[<[fish_area]>.common_fish].random>
    - define experience:+:<[config].data_key[fish.<[item]>.min_catch].mul[1]>
    - define drops:->:<[item]>
    - define drops_dedupe <[drops].deduplicate>

  #- condense the list
  - define drops_report <list[]>
  - foreach <[drops_dedupe]> as:item:
    - if <[drops_report].contains_any_text[<[item]>]>:
      - foreach next
    - define amount <[drops].count[<[item]>]>
    - define drops_report:->:<[item]>~<[amount]>
    - wait 1t

  #- build report embed
  - if <[attack].exists>:
    - choose <[attack]>:
      - case succeed:
        - define message:->:<[config].data_key[<[fish_area]>.attack_succeed_message].parsed>
        - define embed.color <color[255,0,0]>
        - define embed.thumbnail https://cdn.discordapp.com/attachments/1004961963136274506/1008919761171783821/pirates-of-the-caribbean_1.png
      - case fail:
        - define message:->:<[config].data_key[<[fish_area]>.attack_repel_message].parsed>
        - define embed.color <color[0,254,0]>
        - define embed.thumbnail https://media.discordapp.net/attachments/1004632880976236575/1005278813992792094/shield.png
      - case none:
        - define embed.color <color[0,254,255]>
        - define embed.thumbnail https://media.discordapp.net/attachments/1004961963136274506/1008498798215041085/coastal.png
  - foreach <[drops_report]> as:item:
    - define name <[item].before[<&lb>].before[~].replace_text[_].with[<&sp>].to_titlecase><&sp>X<[item].after[~]>
    - define message:->:<&lt><[config].data_key[emoji_key.<[item].before[<&lb>].before[~]>].if_null[<&co>bundle<&co>1004595597698932766].parsed><&gt><[name]>
  - define embed.title "Frank Has Returned!"
  - if <[rod_broke]>:
    - define message:->:<&nl>Oh<&sp>no!<&sp>Frank<&sq>s<&sp><[rod].to_titlecase><&sp>Fishing<&sp>Rod<&sp>broke
  - define embed.description "<&lt>@<[user].flag[discord.account_linked].id><&gt><&nl><[message].separated_by[<&nl>]><&nl><&nl><&lt>a<&co>experience_orb<&co>1004596803217395722<&gt> Frank Gained <[experience]> XP"

  - ~discordmessage channel:<[channel]> id:rachela "<discord_embed.with_map[<[embed]>]>"

  #- give item and clear processing flag.
  - inventory close player:<[user]>
  - foreach <[drops_report]> as:item:
    - define globe_contents:->:<[item].before[~]>[quantity=<[item].after[~]>]
  - flag <[user]> fishbot.caught_items:->:fish_globe[inventory_contents=<[globe_contents]>]
  - run fishbot_frank_level_handler def.user:<[user]> def.xp:<[experience]>
  - flag <[user]> fishbot.fishing_now:!

  #- give item and clear processing flag.
