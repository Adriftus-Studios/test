fishbot_Jade_level_handler:
  type: task
  debug: false
  definitions: user|xp
  script:
  - define player <[user]>
  - define Jade_level_current <[player].flag[fishbot.Jade.level].if_null[1]>
  ##Stops exp gain over level 100
  - if <[Jade_level_current]> >= 100:
      - stop
  ##Checks if the exp is greater than whats required to level
  - if <script[fishbot_data_storage].data_key[exp_per_level.<[Jade_level_current]>].sub[<[player].flag[fishbot.Jade.experience_earned]>].sub[<[xp]>]> > 0:
    - flag <[player]> fishbot.Jade.experience_earned:<[player].flag[fishbot.Jade.experience_earned].add[<[xp]>]>
  ##if the player is able to level, increases the level flag,
  ##injects the level up task for achievements and work stations,
  ##re-loops through the exp addition in case they level more than once.
  - else:
    - define xp <[xp].sub[<script[fishbot_data_storage].data_key[exp_per_level.<[Jade_level_current]>].sub[<[player].flag[fishbot.Jade.experience_earned]>]>]>
    - wait 1t
    - flag <[player]> fishbot.Jade.level:++
    - flag <[player]> fishbot.Jade.experience_earned:0
    - run fishbot_Jade_level_up_event def.player:<[player]> def.Jade_level_current:<[Jade_level_current]> def.user:<[user]>
    - wait 20t
    - inject fishbot_Jade_level_handler

fishbot_Jade_level_up_event:
  type: task
  debug: false
  definitions: player|Jade_level_current|user
  script:
    - ~discordmessage channel:1004632880976236575 id:rachela "Jade has leveled up to <[Jade_level_current].if_null[1]> <&lt>@<[user].flag[discord.account_linked].id><&gt>"
    - define config <script[fishbot_data_storage]>
    - if <[config].list_keys[Jade_unlocks].contains_any[<[Jade_level_current]>]>:
      - define path Jade_unlocks.<[Jade_level_current]>
      - define type <[config].data_key[<[path]>.type]>
      - define name <[config].data_key[<[path]>.object]>

      - choose <[type]>:
        - case bait:
          - define effect <[config].data_key[<[path]>.effect].parsed>
          - define message __**<[name]>**__<&nl>**Effect<&co>**<&sp><[effect]>
          - define embed.thumbnail <[config].data_key[<[path]>.thumbnail]>
          - define embed.title "Jade has discovered a new bait!"

        - case rod:
          #- define embed.thumbnail <[config].data_key[<[path]>.thumbnail]>
          - define effect <[config].data_key[<[path]>.effect].parsed>
          - define recipe <[config].data_key[<[path]>.recipe].parsed>
          - define message __**<[name]>**__<&nl>**Effect<&co>**<&sp><[effect]><&nl>**Recipe<&co>**<&nl><[recipe]>
          - define embed.title "Jade can use a new rod!"
        - case area:
          - define embed.title "Jade has found a new area!"
          - define area area.<[name]>
          - define area_description <[config].data_key[<[area]>.description].parsed>
          - define boat_required <[config].data_key[<[area]>.boat_required].parsed>
          - define keys_required <[config].data_key[<[area]>.key_cost].parsed>
          - define fish_drops <[config].list_keys[<[area]>.common_fish].parsed.include[<[config].list_keys[<[area]>.rare_fish].parsed>].parsed.formatted>
          - define message __**<[name]>**__<&nl>**Area<&sp>Description<&co>**<&sp><[area_description]><&nl>**Boat<&sp>Required<&co>**<&sp><[boat_required]><&nl>**Keys<&sp>Required<&co>**<&sp><[keys_required]><&nl>**Fish<&sp>Drops<&co>**<&nl><[fish_drops]><&nl>**Item<&sp>Drops<&co>**<&nl><[item_drops]>

      - define embed.color <color[0,254,255]>
      - define embed.description "<[message]>"
      - ~discordmessage channel:1004632880976236575 id:rachela "<discord_embed.with_map[<[embed]>]>"

      ##fires the advancement task for the given multiple of 10
#    - if <[Jade_level_current]> == 0:
#      - define level <[Jade_level_current].div[10]>
#      - inject fishbot_advancement_compiler
  ##if offline, flags the player to recieve their advancement on their next join.
#    - if !<[player].is_online>:
#      - if <[player].flag[jobs.<[job]>.level].mod[10]> == 0:
#        - flag <[player]> jobs.advancement_due:->:<[job]>~<[level]>
