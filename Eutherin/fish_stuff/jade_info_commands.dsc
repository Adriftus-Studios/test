frank_privatifier:
  debug: false
  type: task
  script:
      - if !<context.options.get[private].if_null[true]>:
        - ratelimit <context.interaction.user> 30s
        - ~discordmessage channel:<context.channel> id:rachela "<discord_embed.with_map[<[embed]>]>"
        - ~discordinteraction delete interaction:<context.interaction>
      - else:
        - ~discordmessage user:<context.interaction.user> id:rachela "<discord_embed.with_map[<[embed]>]>"
        - ~discordinteraction reply interaction:<context.interaction> "Please see your DMs for the requested information!" ephemeral:true

create_fishbot_area_command:
  type: task
  debug: false
  script:
  - definemap options:
      1:
        type: boolean
        name: private
        description: Shall I DM this information?
        required: false

  - ~discordcommand id:Rachela create name:frank_areas "description:Where can Frank fish?" group:546895939781263360 options:<[options]>

fishbot_area_command_handler:
  type: world
  debug: false
  events:
     on discord slash command name:frank_areas:
      - ~discordinteraction defer interaction:<context.interaction> ephemeral
      - foreach <script[fishbot_data_storage].list_keys[area]> as:area:
        - if <context.interaction.user.flag[minecraft.account_linked].flag[fishbot.frank.level]> >= <script[fishbot_data_storage].data_key[area.<[area]>.min_level]>:
          - define message:->:<script[fishbot_data_storage].data_key[area.<[area]>.info].parsed>
      - define embed.color <color[0,254,255]>
      - define embed.title "Where can Frank fish?"
      - define embed.thumbnail https://media.discordapp.net/attachments/692370842813726724/1005278267303006278/water-transportation.png
      - define embed.description "<[message].separated_by[<&nl>]>"

      - inject frank_privatifier


create_fishbot_rod_command:
  type: task
  debug: false
  script:
  - definemap options:
      1:
        type: boolean
        name: private
        description: Shall I DM this information?
        required: false

  - ~discordcommand id:Rachela create name:frank_rods "description:What rods can Frank use?" group:546895939781263360 options:<[options]>

fishbot_rod_command_handler:
  type: world
  debug: false
  events:
     on discord slash command name:frank_rods:
      - ~discordinteraction defer interaction:<context.interaction> ephemeral
      - foreach <script[fishbot_data_storage].list_keys[rod]> as:rod:
        - if <context.interaction.user.flag[minecraft.account_linked].flag[fishbot.frank.level]> >= <script[fishbot_data_storage].data_key[rod.<[rod]>.level]>:
          - define message:->:<script[fishbot_data_storage].data_key[rod.<[rod]>.info].parsed>
      - define embed.color <color[0,254,255]>
      - define embed.title "What rods can Frank use?"
      - define embed.thumbnail https://media.discordapp.net/attachments/692370842813726724/1005278267303006278/water-transportation.png
      - define embed.description "<[message].separated_by[<&nl>]>"

      - inject frank_privatifier


create_fishbot_boat_command:
  type: task
  debug: false
  script:
  - definemap options:
      1:
        type: boolean
        name: private
        description: Shall I DM this information?
        required: false

  - ~discordcommand id:Rachela create name:frank_boat "description:Which boats can Frank use?" group:546895939781263360 options:<[options]>

fishbot_boat_command_handler:
  type: world
  debug: false
  events:
     on discord slash command name:frank_boat:
      - ~discordinteraction defer interaction:<context.interaction> ephemeral
      - foreach <script[fishbot_data_storage].list_keys[boat].exclude[none]> as:boat:
        - if <context.interaction.user.flag[minecraft.account_linked].flag[fishbot.frank.level]> >= <script[fishbot_data_storage].data_key[boat.<[boat]>.level]>:
          - define message:->:<script[fishbot_data_storage].data_key[boat.<[boat]>.info].parsed>
      - define embed.color <color[0,254,255]>
      - define embed.title "What boats can Frank use?"
      - define embed.thumbnail https://media.discordapp.net/attachments/692370842813726724/1005278267303006278/water-transportation.png
      - define embed.description "<[message].separated_by[<&nl>]>"

      - inject frank_privatifier


create_fishbot_bait_command:
  type: task
  debug: false
  script:
  - definemap options:
      1:
        type: boolean
        name: private
        description: Shall I DM this information?
        required: false

  - ~discordcommand id:Rachela create name:frank_bait "description:Which baits can Frank use?" group:546895939781263360 options:<[options]>

fishbot_bait_command_handler:
  type: world
  debug: false
  events:
     on discord slash command name:frank_bait:
      - ~discordinteraction defer interaction:<context.interaction> ephemeral
      - foreach <script[fishbot_data_storage].list_keys[bait].exclude[none]> as:bait:
        - if <context.interaction.user.flag[minecraft.account_linked].flag[fishbot.frank.level]> >= <script[fishbot_data_storage].data_key[bait.<[bait]>.level]>:
          - define message:->:<script[fishbot_data_storage].data_key[bait.<[bait]>.info].parsed>
      - define embed.color <color[0,254,255]>
      - define embed.title "What bait can Frank use?"
      - define embed.thumbnail https://media.discordapp.net/attachments/692370842813726724/1005278267303006278/water-transportation.png
      - define embed.description "<[message].separated_by[<&nl>]>"

      - inject frank_privatifier

create_fishbot_frank_command:
  type: task
  debug: false
  script:
  - definemap options:
      1:
        type: boolean
        name: private
        description: Shall I DM this information?
        required: false

  - ~discordcommand id:Rachela create name:frank "description:Information about Frank." group:546895939781263360 options:<[options]>

create_fishbot_frank_commands:
  type: task
  debug: false
  script:
  - inject create_fishbot_frank_command
  - inject create_fishbot_bait_command
  - inject create_fishbot_boat_command
  - inject create_fishbot_rod_command
  - inject create_fishbot_area_command
