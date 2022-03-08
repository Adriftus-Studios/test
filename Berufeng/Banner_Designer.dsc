#=====================================================================#
#   CONFIG                                                            #
#=====================================================================#
# You may configure these options as indicated.
Banner_Designer_Config:
  type: data
  # Cooldown: Adjusts how long the machine will wait for confirmation before         #
  #           cancelling the save/exit sequence.                                     #
  Cooldown: 50t
  # Max_Placed: Configure how many of each banner type may be placed in the world.
  #     Base = Default amount (per plot, or per player for Personal).                #
  #     Per_Upgrade = Added to Base value per plot when an upgrade is purchased.     #
  #     Max_Upgrades = How many upgrades a Town/Nation is allowed to purchase.       #
  Max_Placed:
    Personal:
      Base: 3
    Town:
      Base: 10
      Per_Upgrade: 2
      Max_Upgrades: 10
    Nation:
      Base: 5
      Per_Upgrade: 1
      Max_Upgrades: 20
  # Token_Cost: Sets the prices of Banner_Token items at the vendor.
  #     Single = Single Use token, which produces one custom banner when saved.      #
  #     Personal = Personal Emblem token, which changes the player's custom emblem   #
  #                and updates existing personal flags around the world.             #
  #     Town = Town Flag token, which changes the player's town flag and updates     #
  #            existing town flags around the world.                                 #
  #     Nation = National Flag token, which changes the player's national flag and   #
  #              updates existing national flags around the world.                   #
  Token_Cost:
    Single: 0
    Personal: 0
    Town: 0
    Nation: 0
  # Token_Produces_Banner: If false, saving will only update existing and future     #
  #                        placed flags. If true, saving a Personal/Town/Nation      #
  #                        banner will also give the player the corresponding        #
  #                        banner item, as if purchased from the vendor.             #
  Token_Produces_Banner: false
  # Item_Cost: Sets the prices of Banner items at the vendor.                        #
  #     Blank = A blank banner of a given color.                                     #
  #     Premade = A custom, dev-made banner, for single-use.                         #
  #     Personal = A banner displaying the player's custom personal emblem.          #
  #                A limited amount can be placed in the world (see Config option).  #
  #     Town = A banner displaying the player's town's flag. Limited by Config.      #
  #     Nation = A banner displaying the player's national flag. Limited by Config.  #
  Item_Cost:
    Blank: 0
    Premade: 0
    Personal: 0
    Town: 0
    Nation: 0
  # Banner_Item_Load: If true, right clicking the display with a held banner        #
  #                   while using the banner machine will upload its contents,      #
  #                   replacing the current design.                                 #
  Banner_Item_Load: true

#=====================================================================#
#   OPERATIONS                                                        #
#=====================================================================#
## -- DO NOT EDIT ANYTHING BELOW THIS LINE -- ##

Banner_Designer_Version:
  type: data
  version: 1.0.1
  last_updated: 2022_03_07

Banner_Designer_Data:
  type: data
  Max_Layers: 16
  Modes:
    Test:
      subtitle: <aqua>in <gray><bold>Testing <aqua>Mode
    Town:
      subtitle: <aqua>in <blue><bold>Town <aqua>Mode
    Nation:
      subtitle: <aqua>in <gold><bold>Nation <aqua>Mode
    Personal:
      subtitle: <aqua>in <red><bold>Personal Emblem <aqua>Mode
    Single:
      subtitle: <aqua>in <dark_gray><bold>Single Use Banner <aqua>Mode
  Signs:
    Color:
      default: <list[===============|Banner|Designer|===============]>
    Layer:
      default: <list[<&sp>|Insert<&sp>Token|Above|<&sp>]>
    Pattern:
      default: <list[<&sp>|Insert<&sp>Token|<&lt>------|<&sp>]>
  Color:
    0: White
    1: Red
    2: Orange
    3: Yellow
    4: Lime
    5: Green
    6: Cyan
    7: Light_Blue
    8: Blue
    9: Pink
    10: Magenta
    11: Purple
    12: Light_Gray
    13: Gray
    14: Brown
    15: Black
  Pattern:
    0:
      name: None
      internal: BASE
    1:
      name: Base
      internal: STRIPE_BOTTOM
    2:
      name: Chief
      internal: STRIPE_TOP
    3:
      name: Pale Dex.
      internal: STRIPE_LEFT
    4:
      name: Pale Sin.
      internal: STRIPE_RIGHT
    5:
      name: Pale
      internal: STRIPE_CENTER
    6:
      name: Fess
      internal: STRIPE_MIDDLE
    7:
      name: Bend
      internal: STRIPE_DOWNRIGHT
    8:
      name: Bend Sin.
      internal: STRIPE_DOWNLEFT
    9:
      name: Paly
      internal: STRIPE_SMALL
    10:
      name: Saltire
      internal: CROSS
    11:
      name: Cross
      internal: STRAIGHT_CROSS
    12:
      name: Per Bend Sin.
      internal: DIAGONAL_LEFT
    13:
      name: Per Bend
      internal: DIAGONAL_RIGHT_MIRROR
    14:
      name: Per Bend Inv.
      internal: DIAGONAL_LEFT_MIRROR
    15:
      name: P.B. Sin. Inv.
      internal: DIAGONAL_RIGHT
    16:
      name: Per Pale
      internal: HALF_VERTICAL
    17:
      name: Per Pale Inv.
      internal: HALF_VERTICAL_MIRROR
    18:
      name: Per Fess
      internal: HALF_HORIZONTAL
    19:
      name: Per Fess Inv.
      internal: HALF_HORIZONTAL_MIRROR
    20:
      name: B. Dex. Canton
      internal: SQUARE_BOTTOM_LEFT
    21:
      name: B. Sin. Canton
      internal: SQUARE_BOTTOM_RIGHT
    22:
      name: Ch. Dex. Cant.
      internal: SQUARE_TOP_LEFT
    23:
      name: Ch. Sin. Cant.
      internal: SQUARE_TOP_RIGHT
    24:
      name: Chevron
      internal: TRIANGLE_BOTTOM
    25:
      name: Inv. Chevron
      internal: TRIANGLE_TOP
    26:
      name: B. Indented
      internal: TRIANGLES_BOTTOM
    27:
      name: Ch. Indented
      internal: TRIANGLES_TOP
    28:
      name: Roundel
      internal: CIRCLE_MIDDLE
    29:
      name: Lozenge
      internal: RHOMBUS_MIDDLE
    30:
      name: Bordure
      internal: BORDER
    31:
      name: Bord. Indented
      internal: CURLY_BORDER
    32:
      name: Field Masoned
      internal: BRICKS
    33:
      name: Gradient
      internal: GRADIENT
    34:
      name: B. Gradient
      internal: GRADIENT_UP
    35:
      name: Creeper
      internal: CREEPER
    36:
      name: Snout
      internal: PIGLIN
    37:
      name: Skull
      internal: SKULL
    38:
      name: Flower
      internal: FLOWER
    39:
      name: Thing
      internal: MOJANG
    40:
      name: Globe
      internal: GLOBE

Banner_Designer_Create:
  type: world
  debug: true
  events:
    on player right clicks block type:loom with:decorator_tool_item priority:0:
    # For creating Banner Designer machines.
      - if <context.location.above.material.name> == diamond_block:
        - if <player.is_sneaking>:
          - if <player.has_flag[banner_designer_createready]>:
            - flag <player> banner_designer_createready:!
            - define uuid <util.random_uuid>
            - narrate "<blue>Success! <aqua>Created Banner Designer with UUID:"
            - narrate <aqua><italic><[uuid]>
            - define direction <context.location.material.direction>
            - choose <[direction]>:
              - case north:
                - define low <context.location.add[1,0,0]>
                - define high <context.location.add[-1,3,0]>
                - define layerdownbutton <context.location.add[1,0,-1]>
                - define layerupbutton <context.location.add[-1,0,-1]>
                - define completebutton <context.location.add[0,3,-1]>
                - define resetbutton <context.location.add[1,0,-2]>
                - define exitbutton <context.location.add[-1,0,-2]>
                - define cuboidorigin <context.location.add[1,0,-4]>
                - define away SOUTH
                - define viewpoint <context.location.center.add[0,-0.5,-4].with_pose[-6,0]>
              - case east:
                - define low <context.location.add[0,0,1]>
                - define high <context.location.add[0,3,-1]>
                - define layerdownbutton <context.location.add[1,0,1]>
                - define layerupbutton <context.location.add[1,0,-1]>
                - define completebutton <context.location.add[1,3,0]>
                - define resetbutton <context.location.add[2,0,1]>
                - define exitbutton <context.location.add[2,0,-1]>
                - define cuboidorigin <context.location.add[4,0,1]>
                - define away WEST
                - define viewpoint <context.location.center.add[4,-0.5,0].with_pose[-6,90]>
              - case south:
                - define low <context.location.add[-1,0,0]>
                - define high <context.location.add[1,3,0]>
                - define layerdownbutton <context.location.add[-1,0,1]>
                - define layerupbutton <context.location.add[1,0,1]>
                - define completebutton <context.location.add[0,3,1]>
                - define resetbutton <context.location.add[-1,0,2]>
                - define exitbutton <context.location.add[1,0,2]>
                - define cuboidorigin <context.location.add[-1,0,4]>
                - define away NORTH
                - define viewpoint <context.location.center.add[0,-0.5,4].with_pose[-6,-180]>
              - case west:
                - define low <context.location.add[0,0,-1]>
                - define high <context.location.add[0,3,1]>
                - define layerdownbutton <context.location.add[-1,0,-1]>
                - define layerupbutton <context.location.add[-1,0,1]>
                - define completebutton <context.location.add[-1,3,0]>
                - define resetbutton <context.location.add[-2,0,-1]>
                - define exitbutton <context.location.add[-2,0,1]>
                - define cuboidorigin <context.location.add[-4,0,-1]>
                - define away EAST
                - define viewpoint <context.location.center.add[-4,-0.5,0].with_pose[-6,-90]>
            - modifyblock <[low].to_cuboid[<[high]>]> netherite_block
            - spawn <entity[glow_item_frame].with[invulnerable=true;hide_from_players=true;framed=Banner_Designer_Complete_Button]> <[completebutton]> save:complete
            - spawn <entity[item_frame].with[framed=<item[Banner_Designer_Arrow_Blue].with_single[display_name=<aqua>Color<&sp>Down]>|flipped;hide_from_players=true;invulnerable=true]> <[layerdownbutton].above> save:colordown
            - spawn <entity[item_frame].with[framed=<item[Banner_Designer_Arrow_Blue].with_single[display_name=<aqua>Color<&sp>Up]>|none;hide_from_players=true;invulnerable=true]> <[layerdownbutton].above[2]> save:colorup
            - spawn <entity[item_frame].with[framed=<item[Banner_Designer_Arrow_Green].with_single[display_name=<yellow>Pattern<&sp>Down]>|flipped;hide_from_players=true;invulnerable=true]> <[layerupbutton].above> save:patterndown
            - spawn <entity[item_frame].with[framed=<item[Banner_Designer_Arrow_Green].with_single[display_name=<yellow>Pattern<&sp>Up]>|none;hide_from_players=true;invulnerable=true]> <[layerupbutton].above[2]> save:patternup
            - spawn <entity[item_frame].with[framed=<item[Banner_Designer_Reset_Button]>|none;hide_from_players=true;invulnerable=true]> <[resetbutton]> save:reset
            - spawn <entity[item_frame].with[framed=<item[Banner_Designer_Exit_Button]>|none;hide_from_players=true;invulnerable=true]> <[exitbutton]> save:exit
            - foreach complete|colordown|colorup|patterndown|patternup|reset|exit:
              - flag <entry[<[value]>].spawned_entity> banner_designer.<[uuid]>:<[value]>
              - flag server banner_designer.<[uuid]>.<[value]>:<entry[<[value]>].spawned_entity>
            - wait 1t
            - modifyblock <context.location.above[3]> observer[direction=<[away]>;switched=FALSE]
            - modifyblock <context.location.above>|<context.location.above[2]> sea_lantern
            - modifyblock <[layerdownbutton].above[3]>|<[layerupbutton].above[3]>|<[completebutton].below[3]> birch_wall_sign[direction=<[direction]>]
            - modifyblock <[layerdownbutton]>|<[layerupbutton]> birch_button[direction=<[direction]>]
            - adjust <[layerdownbutton].above[3]> sign_contents:<script[Banner_Designer_Data].parsed_key[Signs.Color.default]>
            - adjust <[layerupbutton].above[3]> sign_contents:<script[Banner_Designer_Data].parsed_key[Signs.Pattern.default]>
            - adjust <[completebutton].below[3]> sign_contents:<script[Banner_Designer_Data].parsed_key[Signs.Layer.default]>
            - note <[layerdownbutton]> as:banner_designer_<[uuid]>_layerdown
            - note <[layerupbutton]> as:banner_designer_<[uuid]>_layerup
            - note <[layerdownbutton].above[3]> as:banner_designer_<[uuid]>_colorsign
            - note <[layerupbutton].above[3]> as:banner_designer_<[uuid]>_patternsign
            - note <[completebutton]> as:banner_designer_<[uuid]>_complete
            - note <[completebutton].below[3]> as:banner_designer_<[uuid]>_layersign
            - note <[viewpoint]> as:banner_designer_<[uuid]>_viewpoint
            - note <[cuboidorigin].to_cuboid[<[high]>]> as:banner_designer_<[uuid]>
          - else:
            - narrate "<dark_green>Create an <green>Banner Designer <dark_green>machine here, facing <aqua><context.location.material.direction><dark_green>?"
            - narrate "<green><italic>Click again <dark_green><italic>to confirm."
            - flag <player> banner_designer_createready
            - wait <script[Banner_Designer_Config].data_key[Cooldown]>
            - if <player.has_flag[banner_designer_createready]>:
              - narrate <dark_red><italic>Canceled.
              - flag <player> banner_designer_createready:!
    on player right clicks birch_wall_sign with:decorator_tool_item:
    # For removal of existing machines.
      - if <context.location.cuboids.contains_any_text[banner_designer_]||false>:
        - determine passively cancelled
        - if <player.is_sneaking>:
          - if <player.has_flag[banner_designer_destroyready]>:
            - flag <player> banner_machine_in_use:!
            - flag <player> banner_designer_destroyready:!
            - define uuid <context.location.cuboids.get[1].after[banner_designer_]>
            - narrate "<blue>Success! <aqua>Removing <green>Banner Designer <aqua>with UUID:"
            - narrate <aqua><italic><[uuid]>
            - remove <location[banner_designer_<[uuid]>_layersign].find_entities[armor_stand].within[1]>
            - foreach patternup|patterndown|colorup|colordown|reset|exit:
              - remove <server.flag[banner_designer.<[uuid]>.<[value]>]>
            - foreach <cuboid[banner_designer_<[uuid]>].blocks.filter[note_name.starts_with[banner_designer_]]>:
              - note remove as:banner_designer_<[uuid]>_<[value].note_name.after_last[_]>
            - wait 1t
            - modifyblock <cuboid[banner_designer_<[uuid]>].blocks[*_button|*_wall_sign]> air
            - modifyblock <cuboid[banner_designer_<[uuid]>]> air
            - remove <cuboid[banner_designer_<[uuid]>].entities[*item_frame]>
            - note remove as:banner_designer_<[uuid]>
            - flag server banner_designer.<[uuid]>:!
          - else:
            - narrate "<dark_red><bold>[WARNING]: Destroy <red><bold>Banner Designer <dark_red><bold>machine?"
            - narrate "<red><italic>Click again <dark_red><italic>to confirm. (This cannot be undone.)"
            - flag <player> banner_designer_destroyready
            - wait <script[Banner_Designer_Config].data_key[Cooldown]>
            - if <player.has_flag[banner_designer_destroyready]>:
              - narrate <dark_red><italic>Canceled.
              - flag <player> banner_designer_destroyready:!

Banner_Designer_Start:
  type: task
  debug: false
  script:
  - define direction <context.location.direction[<location[banner_designer_<[uuid]>_viewpoint]>]>
  - choose <[direction]>:
    - case north:
      - define sub 0,1.28,-0.2
      - define yaw 180
    - case east:
      - define sub 0.2,1.28,0
      - define yaw 270
    - case south:
      - define sub 0,1.28,0.2
      - define yaw 0
    - case west:
      - define sub -0.2,1.28,0
      - define yaw 90
  - spawn armor_stand[equipment=air|air|air|white_banner;gravity=false;visible=false;invulnerable=true;hide_from_players=true] <location[banner_designer_<[uuid]>_layersign].center.sub[<[sub]>].with_yaw[<[yaw]>]> save:armor_stand
  - flag <player> banner_designer.<[uuid]>.armor_stand:<entry[armor_stand].spawned_entity>
  - wait 1t
  - adjust <player> show_entity:<player.flag[banner_designer.<[uuid]>.armor_stand]>
  - adjust <player> show_entity:<server.flag[banner_designer.<[uuid]>.complete]>
  - wait 1t
  - inject Banner_Designer_Update.start instantly

Banner_Designer_Function:
  type: world
  debug: true
  events:
    on player right clicks observer with:banner_token_* in:banner_designer_*:
      - determine passively cancelled
      - ratelimit <player> 2t
      - choose <context.item.script.name.after[banner_token_]>:
        - case town:
          - if !<player.has_town>:
            - narrate "<dark_red>You don't have a town!"
            - title "subtitle:<dark_red>No Town!" targets:<player>
            - stop
          - if <player.has_permission[adriftus.banner.town]>:
            - if <player.town.has_flag[editing_banner]||false>:
              - narrate "<red>You can't do that right now! <dark_gray><player.town.flag[editing_banner].as_player.name> <red>is currently editing the town flag."
              - stop
            - else:
              - flag <player.town> editing_banner:<player.uuid>
          - else:
            - narrate "<dark_red>You don't have permission to edit your <blue>Town Flag<dark_red>."
            - title "title:<red>ACCESS DENIED" targets:<player>
            - narrate "<gray>Only <white><player.town.mayor.name> <gray>has the ability to set these permissions."
            - stop
        - case nation:
          - if !<player.has_nation>:
            - narrate "<dark_red>You don't have a nation!"
            - title "subtitle:<dark_red>No Nation!" targets:<player>
            - stop
          - if <player.has_permission[adriftus.banner.nation]>:
            - if <player.nation.has_flag[editing_banner]||false>:
              - narrate "<red>You can't do that right now! <dark_gray><player.nation.flag[editing_banner].as_player.name> <red>is currently editing the national flag."
              - stop
            - else:
              - flag <player.nation> editing_banner:<player.uuid>
          - else:
            - narrate "<dark_red>You don't have permission to edit your <gold>National Flag<dark_red>."
            - title "title:<red>ACCESS DENIED" targets:<player>
            - narrate "<gray>Only <white><player.nation.king.name> <gray>has the ability to set these permissions."
            - stop
      - if !<player.has_flag[banner_machine_in_use]>:
        - narrate <context.location.cuboids.filter[contains_any_text[banner_designer_]].get[1].after[banner_designer_]>
        - define uuid:<context.location.cuboids.filter[contains_any_text[banner_designer_]].get[1].after[banner_designer_]>
        - flag <player> banner_machine_in_use:<[uuid]>
        - flag <player> banner_designer.<[uuid]>.mode:<context.item.script.name.after[banner_token_]>
        - wait 1t
        - take iteminhand
        - inject Banner_Designer_Start instantly
      - stop
    on player right clicks birch_button:
      - if <context.location.cuboids.contains_any_text[banner_designer_]||false>:
        - determine passively cancelled
        - ratelimit <player> 2t
        - if <player.has_flag[banner_machine_in_use]>:
          - define uuid <context.location.note_name.after[banner_designer_].before_last[_]>
          - choose <context.location.after_last[_]>:
            - case layerdown:
              - if <player.flag[banner_designer.<[uuid]>.layer]||0> == 0:
                - stop
              - else:
                - flag player banner_designer.<[uuid]>.layer:--
              - wait 1t
              - inject banner_designer_Update instantly
            - case layerup:
              - if <player.flag[banner_designer.<[uuid]>.layer]||0> == <script[Banner_Designer_Data].data_key[Max_Layers]>:
                - stop
              - else:
                - flag player banner_designer.<[uuid]>.layer:++
              - wait 1t
              - inject Banner_Designer_Update instantly
            - default:
              - stop
    on player right clicks *item_frame:
      - if <context.entity.location.cuboids.contains_any_text[banner_designer_]||false>:
        - determine passively cancelled
        - ratelimit <player> 2t
        - define uuid <context.entity.flag[banner_designer].keys.get[1]>
        - define layer <player.flag[banner_designer.<[uuid]>.layer]||0>
        - choose <context.entity.flag[banner_designer.<[uuid]>]>:
          - case colorup:
            - if <player.flag[banner_designer.<[uuid]>.color.<[layer]>]||0> == 15:
              - flag <player> banner_designer.<[uuid]>.color.<[layer]>:0
            - else:
              - flag <player> banner_designer.<[uuid]>.color.<[layer]>:++
          - case colordown:
            - if <player.flag[banner_designer.<[uuid]>.color.<[layer]>]||0> == 0:
              - flag <player> banner_designer.<[uuid]>.color.<[layer]>:15
            - else:
              - flag <player> banner_designer.<[uuid]>.color.<[layer]>:--
          - case patternup:
            - if <player.flag[banner_designer.<[uuid]>.layer]||0> == 0:
              - stop
            - if <player.flag[banner_designer.<[uuid]>.pattern.<[layer]>]||0> == 40:
              - flag <player> banner_designer.<[uuid]>.pattern.<[layer]>:0
            - else:
              - flag <player> banner_designer.<[uuid]>.pattern.<[layer]>:++
          - case patterndown:
            - if <player.flag[banner_designer.<[uuid]>.layer]||0> == 0:
              - stop
            - if <player.flag[banner_designer.<[uuid]>.pattern.<[layer]>]||0> == 0:
              - flag <player> banner_designer.<[uuid]>.pattern.<[layer]>:40
            - else:
              - flag <player> banner_designer.<[uuid]>.pattern.<[layer]>:--
          - case exit:
            - if <player.has_flag[banner_designer_saveready]>:
              - stop
            - if <player.has_flag[banner_designer_exitready]>:
              - flag <player> banner_designer_exitready:!
              - title "title:<dark_red>Exiting <bold>Banner Designer" "subtitle:<red>Your token has been refunded." targets:<player>
              - give banner_token_<player.flag[banner_designer.<[uuid]>.mode]>
              - inject Banner_Designer_Update.stop instantly
              - stop
            - else:
              - narrate "<red><bold>Do you want to exit and lose all progress?"
              - narrate "<red>(Your token will be refunded.)"
              - narrate "<gray><italic>Click again to confirm."
              - title "title:<dark_red>Exit and lose all progress?" "subtitle:<gray><italic>Click again to confirm." targets:<player> fade_in:5t stay:1s fade_out:5t
              - flag <player> banner_designer_exitready
              - wait <script[Banner_Designer_Config].data_key[Cooldown]>
              - if <player.has_flag[banner_designer_exitready]>:
                - narrate <green>Resuming.
                - title subtitle:<green>Resuming. fade_in:5t stay:15t fade_out:2t
                - flag <player> banner_designer_exitready:!
              - stop
          - case reset:
            - if <player.flag[banner_designer.<[uuid]>.layer]||0> > 0 || <player.flag[banner_designer.<[uuid]>.color.0]||0> > 0:
              - inject Banner_Designer_Reset instantly
            - else:
              - title "subtitle:<gray>Nothing to reset!" targets:<player> fade_in:5t stay:15t fade_out:2t
              - stop
          - case complete:
            - if <player.has_flag[banner_designer_exitready]>:
              - stop
            - if <player.has_flag[banner_designer_blankready]>:
              - inject Banner_Designer_Save.blank instantly
              - stop
            - else:
              - inject Banner_Designer_Save.presave instantly
              - stop
          - default:
            - stop
        - inject Banner_Designer_Update instantly
    on *item_frame damaged:
      - if <context.entity.location.cuboids.contains_any_text[banner_designer_]>:
        - determine cancelled
    on player breaks block in:banner_designer_*:
      - if <context.location.cuboids.contains_any_text[banner_designer_]>:
        - determine cancelled
    on hanging breaks:
      - if <context.hanging.location.cuboids.contains_any_text[banner_designer_]>:
        - determine cancelled
    on player places block:
      - if <context.location.cuboids.contains_any_text[banner_designer_]>:
        - determine cancelled
    after player enters banner_designer_*:
      - adjust <player> hide_from_players
    after player exits banner_designer_*:
      - adjust <player> show_to_players

Banner_Designer_Update:
  type: task
  debug: false
  script:
    - define base_color <script[Banner_Designer_Data].data_key[Color.<player.flag[banner_designer.<[uuid]>.color.0]||0>]>
    - repeat <script[Banner_Designer_Data].data_key[Max_Layers]>:
      - if <player.flag[banner_designer.<[uuid]>.pattern.<[value]>]||0> > 0:
        - define banner_layers:->:<script[Banner_Designer_Data].data_key[Color.<player.flag[banner_designer.<[uuid]>.color.<[value]>]||0>]>/<script[Banner_Designer_Data].data_key[Pattern.<player.flag[banner_designer.<[uuid]>.pattern.<[value]>]>.internal]>
    - if <[banner_layers]||null> != null:
      - define equipment:<list[air|air|air|<[base_color]>_banner[patterns=<[banner_layers]>]]>
    - else:
      - define equipment:<list[air|air|air|<[base_color]>_banner]>
    - adjust <player.flag[banner_designer.<[uuid]>.armor_stand].as_entity> equipment:<[equipment]>
    - if <player.flag[banner_designer.<[uuid]>.layer]||0> == 0:
      - flag <player> banner_designer.<[uuid]>.layer:0
      - define layername Base
      - adjust <player> hide_entity:<server.flag[banner_designer.<[uuid]>.patternup].as_entity>
      - adjust <player> hide_entity:<server.flag[banner_designer.<[uuid]>.patterndown].as_entity>
    - else:
      - define layername <player.flag[banner_designer.<[uuid]>.layer]>
      - adjust <player> show_entity:<server.flag[banner_designer.<[uuid]>.patternup].as_entity>
      - adjust <player> show_entity:<server.flag[banner_designer.<[uuid]>.patterndown].as_entity>
    - define color "<script[Banner_Designer_Data].data_key[Color.<player.flag[banner_designer.<[uuid]>.color.<player.flag[banner_designer.<[uuid]>.layer]||0>]||0>].replace[_].with[ ]>"
    - define pattern <script[Banner_Designer_Data].data_key[Pattern.<player.flag[banner_designer.<[uuid]>.pattern.<player.flag[banner_designer.<[uuid]>.layer]>]||0>.name]>
    - adjust <player> "sign_update:<location[banner_designer_<[uuid]>_layersign]>|<list_single[||==[ LAYER ]==||].include_single[].include_single[<aqua><[layername]>].include_single[||============||]>"
    - adjust <player> "sign_update:<location[banner_designer_<[uuid]>_colorsign]>|<list_single[||==[ COLOR ]==||].include_single[].include_single[<aqua><[color]>].include_single[||============||]>"
    - if <player.flag[banner_designer.<[uuid]>.layer]||0> > 0:
      - adjust <player> "sign_update:<location[banner_designer_<[uuid]>_patternsign]>|<list_single[||=[ PATTERN ]=||].include_single[].include_single[<aqua><[pattern]>].include_single[||============||]>"
    - else:
      - adjust <player> sign_update:<location[banner_designer_<[uuid]>_patternsign]>|<list[]>
  start:
    - adjust <player> "sign_update:<location[banner_designer_<[uuid]>_layersign]>|<list_single[||==[ LAYER ]==||].include_single[].include_single[<aqua>Base].include_single[||============||]>"
    - adjust <player> "sign_update:<location[banner_designer_<[uuid]>_colorsign]>|<list_single[||==[ COLOR ]==||].include_single[].include_single[<aqua>White].include_single[||============||]>"
    - adjust <player> sign_update:<location[banner_designer_<[uuid]>_patternsign]>|<list[]>
    - foreach colorup|colordown|reset|exit:
      - adjust <player> show_entity:<server.flag[banner_designer.<[uuid]>.<[value]>].as_entity>
    - run Generic_Freeze_Task instantly def:<player>|freeze|banner_designer_<[uuid]>_viewpoint
    - title "title:<blue>Launched <bold>Banner Designer" subtitle:<script[Banner_Designer_Data].parsed_key[Modes.<player.flag[banner_designer.<[uuid]>.mode]>.subtitle]> targets:<player> fade_in:15t stay:1s fade_out:15t
    - inject Banner_Designer_Update.preload instantly
  stop:
    - adjust <player> sign_update:banner_designer_<[uuid]>_layersign|<location[banner_designer_<[uuid]>_layersign].sign_contents>
    - adjust <player> sign_update:banner_designer_<[uuid]>_colorsign|<location[banner_designer_<[uuid]>_colorsign].sign_contents>
    - adjust <player> sign_update:banner_designer_<[uuid]>_patternsign|<location[banner_designer_<[uuid]>_patternsign].sign_contents>
    - foreach colorup|colordown|patternup|patterndown|reset|exit|complete:
      - adjust <player> hide_entity:<server.flag[banner_designer.<[uuid]>.<[value]>].as_entity>
    - remove <player.flag[banner_designer.<[uuid]>.armor_stand].as_entity>
    - flag <player> banner_designer:!
    - flag <player> banner_machine_in_use:!
    - run Generic_Freeze_Task instantly def:<player>|unfreeze
    - stop
  preload:
    - choose <player.flag[banner_designer.<[uuid]>.mode]>:
      - case test:
        - narrate "<gray>This script will not load a banner design."
      - case town:
        - if <player.town.has_flag[banner_design]||false>:
          - narrate "<blue>Loaded the Town Flag design for <player.town.name>."
          - define preload <player.town.flag[banner_design]>
          - inject Banner_Designer_Update.load instantly
        - else:
          - narrate "<blue>This town does not have a flag yet. Setting machine to default."
      - case nation:
        - if <player.nation.has_flag[banner_design]||false>:
          - narrate "<gold>Loaded the National Flag design for <player.nation.name>."
          - define preload <player.nation.flag[banner_design]>
          - inject Banner_Designer_Update.load instantly
        - else:
          - narrate "<gold>This nation does not have a flag yet. Setting machine to default."
      - case personal:
        - if <player.has_flag[banner_designer_personal_emblem]>:
          - narrate "<red>Loaded your stored Personal Emblem design."
          - define preload <player.flag[banner_designer_personal_emblem]>
          - inject Banner_Designer_Update.load instantly
        - else:
          - narrate "<red>No personal emblem found. Setting machine to default."
  load:
    - flag <player> banner_designer.<[uuid]>.color.0:<player.flag[banner_designer_personal_emblem].as_list.get[1]||0>
    - narrate "Base Color: <script[Banner_Designer_Data].data_key[Color.<player.flag[banner_designer.<[uuid]>.color.0]>]>"
    - repeat <[preload].size.sub[1]>:
      - flag <player> banner_designer.<[uuid]>.color.<[value]>:<[preload].get[<[value].add[1]>].before[/]>
      - flag <player> banner_designer.<[uuid]>.pattern.<[value]>:<[preload].get[<[value].add[1]>].after[/]>
      - narrate "Layer <[value]>: <script[Banner_Designer_Data].data_key[Color.<[preload].get[<[value].add[1]>].before[/]>]> <script[Banner_Designer_Data].data_key[Pattern.<[preload].get[<[value].add[1]>].after[/]>.name]>"
    - flag <player> banner_designer.<[uuid]>.layer:<[preload].size.sub[1]||0>
    - inject Banner_Designer_Update instantly

Banner_Designer_Converter:
  type: task
  debug: false
  script:
  - define unconverted_list:<[save_banner]>
  - define base_color:<script[Banner_Designer_Data].data_key[Color.<[unconverted_list].as_list.get[1]>]>
  - if <[unconverted_list].as_list.size> > 1:
    - repeat <[unconverted_list].as_list.size.sub[1]>:
      - define converted_color:<script[Banner_Designer_Data].data_key[Color.<[unconverted_list].as_list.get[<[value].add[1]>].before[/]>]>
      - define converted_pattern:<script[Banner_Designer_Data].data_key[Pattern.<[unconverted_list].as_list.get[<[value].add[1]>].after[/]>.internal]>
      - define converted_list:->:<[converted_color]>/<[converted_pattern]>
    - wait 1t
    - define converter_result:<[base_color]>_banner[patterns=<[converted_list].separated_by[|]>]
  - else:
    - define converter_result:<[base_color]>_banner

Banner_Designer_Save:
  type: task
  debug: false
  script:
    - if <player.has_flag[banner_designer_saveready]>:
      - flag <player> banner_designer_saveready:!
      - choose <player.flag[banner_designer.<[uuid]>.mode]>:
        - case town:
          - narrate "<blue>Saving this town flag design for <player.town.name>."
          - narrate "<blue><player.name> just updated the Town Flag!" targets:<player.town.residents>
          - flag <player.town> banner_design:<[save_banner]>
          - inject Banner_Designer_Converter instantly
          - run Banner_Designer_World_Update instantly def.new_banner:<[converter_result]> def.mode:town def.player:<player>
        - case nation:
          - narrate "<gold>Saving this national flag design for <player.nation.name>."
          - narrate "<gold><player.name> just updated the National Flag!" targets:<player.nation.residents>
          - flag <player.nation> banner_design:<[save_banner]>
          - inject Banner_Designer_Converter instantly
          - run Banner_Designer_World_Update instantly def.new_banner:<[converter_result]> def.mode:nation def.player:<player>
        - case personal:
          - narrate "<red>Saving your personal emblem."
          - flag <player> banner_designer_personal_emblem:<[save_banner]>
          - inject Banner_Designer_Converter instantly
          - wait 1t
          - run Banner_Designer_World_Update def.new_banner:<[converter_result]> def.mode:personal def.player:<player>
        - case single:
          - narrate "<dark_gray>Saving your banner."
          - inject Banner_Designer_Converter instantly
          - wait 1t
          - give <[converter_result]>
        - default:
          - narrate "<dark_red>You cannot save your design in this mode."
          - stop
      - title title:<dark_green>Saved! "subtitle:<green>Your token was consumed." targets:<player> fade_in:5t stay:1s fade_out:5t
      - inject Banner_Designer_Update.stop
    - else:
      - narrate "<dark_green>Do you want to save and exit?"
      - narrate "<green>Your token will be consumed."
      - narrate "<gray><italic>Click again to confirm."
      - title "title:<dark_green>Save and exit?" "subtitle:<gray>Click again to confirm." targets:<player> fade_in:5t stay:1s fade_out:5t
      - flag <player> banner_designer_saveready
      - wait <script[Banner_Designer_Config].data_key[Cooldown]>
      - if <player.has_flag[banner_designer_saveready]>:
        - narrate "<dark_red>Cancelling save."
        - title "subtitle:<dark_red>Cancelling save." targets:<player> fade_in:5t stay:15t fade_out:2t
        - flag <player> banner_designer_saveready:!
  presave:
    - define base_color <script[Banner_Designer_Data].data_key[Color.<player.flag[banner_designer.<[uuid]>.color.0]>]||0>
    - repeat <script[Banner_Designer_Data].data_key[Max_Layers]>:
      - if <player.flag[banner_designer.<[uuid]>.pattern.<[value]>]||0> > 0:
        - define save_layers:->:<player.flag[banner_designer.<[uuid]>.color.<[value]>]||0>/<player.flag[banner_designer.<[uuid]>.pattern.<[value]>]>
    - if <[save_layers]||null> != null:
      - define save_banner:<player.flag[banner_designer.<[uuid]>.color.0].as_list.include[<[save_layers]>]>
    - else:
      - define save_banner:<player.flag[banner_designer.<[uuid]>.color.0]||0>
    - if <[save_banner]> == 0:
      - inject Banner_Designer_Save.blank instantly
    - else:
      - inject Banner_Designer_Save instantly
  blank:
    - if <player.has_flag[banner_designer_blankready]>:
      - flag <player> banner_designer_blankready:!
      - choose <player.flag[banner_designer.<[uuid]>.mode]>:
        - case town:
          - narrate "<blue>Overwriting the town flag for <player.town.name>."
          - flag <player.town> banner_design:!
        - case nation:
          - narrate "<gold>Overwriting the national flag for <player.nation.name>."
          - flag <player.nation> banner_design:!
        - case personal:
          - narrate "<red>Overwriting your personal emblem."
          - flag <player> banner_designer_personal_emblem:!
        - case single:
          - narrate "<dark_gray>Overwriting and creating a white banner."
          - give white_banner
        - default:
          - narrate "How did you get here?!"
      - title title:<dark_green>Overwritten! "subtitle:<green>Your token was consumed." targets:<player> fade_in:5t stay:1s fade_out:5t
      - inject Banner_Designer_Update.stop
      - stop
    - else:
      - narrate "<dark_red>Are you sure you want to save this BLANK banner?"
      - narrate "<red>Your token will be consumed and your banner wiped clean."
      - narrate "<gray><italic>Click again to confirm."
      - title "title:<dark_red>Overwrite with BLANK banner and exit?" "subtitle:<gray>Click again to confirm." targets:<player> fade_in:5t stay:1s fade_out:5t
      - flag <player> banner_designer_blankready
      - wait <script[Banner_Designer_Config].data_key[Cooldown]>
      - if <player.has_flag[banner_designer_blankready]>:
        - narrate "<dark_green>Cancelling overwrite."
        - title "subtitle:<dark_red>Cancelling overwrite." targets:<player> fade_in:5t stay:15t fade_out:2t
        - flag <player> banner_designer_blankready:!
        - stop

Banner_Designer_Placement:
  type: world
  debug: true
  events:
    on player places banner_item_*:
      - choose <context.item_in_hand.script.name.after[item_]>:
        - case personal:
          - define max:<script[Banner_Designer_Config].data_key[Max_Placed.Personal.Base]>
          - if <player.flag[placed_banners_personal_emblem].size> >= <[max]>:
            - determine passively cancelled
            - narrate "<dark_red>You can only place <[max]> personal <tern[<[max].is[more].than[1]>].pass[banners].fail[banner]> in the world!"
          - else:
            - flag <context.location> custom_banner.personal:<player.uuid>
            - flag <player> placed_banners_personal_emblem:->:<context.location.simple>
            - define save_banner:<player.flag[banner_designer_personal_emblem]>
            - inject Banner_Designer_Converter instantly
            - run Banner_Designer_World_Update instantly def.new_banner:<[converter_result]> def.mode:personal def.player:<player>
        - case town:
          - if <player.town> != <context.location.town||null>:
            - determine passively cancelled
            - narrate "<dark_red>You can only place your Town Flag within the borders of your own town!"
            - stop
          - define max:<script[Banner_Designer_Config].data_key[Max_Placed.Town.Base].mul[<player.town.plots.size>||1].add[<script[Banner_Designer_Config].data_key[Max_Placed.Town.Per_Upgrade].mul[<player.town.flag[max_banners_upgrade]>]||0>]>
          - if <player.flag[placed_banners_town].size> >= <[max]>:
            - determine passively cancelled
            - narrate "<dark_red>You can only place <[max]> Town <tern[<[max].is[more].than[1]>].pass[Flags].fail[Flag]> in the world!"
            - stop
          - else:
            - flag <context.location> custom_banner.town:<player.town>
            - flag <player.town> placed_banners:->:<context.location.simple>
            - define save_banner:<player.town.flag[banner_design]>
            - inject Banner_Designer_Converter instantly
            - run Banner_Designer_World_Update instantly def.new_banner:<[converter_result]> def.mode:town def.player:<player>
        - case nation:
          - if <player.nation> != <context.location.nation||null>:
            - determine passively cancelled
            - narrate "<dark_red>You can only place your National Flag within the borders of your own nation!"
            - stop
          - define max:<script[Banner_Designer_Config].data_key[Max_Placed.Nation.Base].mul[<player.town.plots.size||1>].add[<script[Banner_Designer_Config].data_key[Max_Placed.Nation.Per_Upgrade].mul[<player.nation.flag[max_banners_upgrade]||0>]>]>
          - if <player.flag[placed_banners_town].size> >= <[max]>:
            - determine passively cancelled
            - narrate "<dark_red>You can only place <[max]> Town <tern[<[max].is[more].than[1]>].pass[Flags].fail[Flag]> in the world!"
            - stop
          - else:
            - flag <context.location> custom_banner.nation:<player.nation>
            - flag <player.nation> placed_banners:->:<context.location.simple>
            - define save_banner:<player.nation.flag[banner_design]>
            - inject Banner_Designer_Converter instantly
            - run Banner_Designer_World_Update instantly def.new_banner:<[converter_result]> def.mode:nation def.player:<player>
    on player breaks *_banner location_flagged:custom_banner:
      - choose <context.location.flag[custom_banner].keys.get[1]>:
        - case personal:
          - if <context.location.flag[custom_banner].get[personal]> != <player.uuid>:
            - determine passively cancelled
            - narrate "<dark_red>You can't destroy <server.flag[personal_banners].get[<context.location.simple>].as_player.name>'s banner!"
          - else:
            - flag <context.location> custom_banner:!
            - flag <player> placed_banners_personal_emblem:<-:<context.location.simple>
        - case town:
          - define town <context.location.flag[custom_banner].get[town]>
          - if <[town]> != <player.town>:
            - determine passively cancelled
            - narrate "<dark_red>You can't destroy <[town].name>'s flag!"
          - else:
            - flag <context.location> custom_banner:!
            - flag <[town]> placed_banners:<-:<context.location.simple>
        - case nation:
          - define nation <context.location.flag[custom_banner].get[nation]>
          - if <[nation]> != <player.nation>:
            - determine passively cancelled
            - narrate "<dark_red>You can't destroy <[nation].name>'s flag!"
          - else:
            - flag <context.location> custom_banner:!
            - flag <[nation]> placed_banners:<-:<context.location.simple>



Banner_Designer_World_Update:
  type: task
  debug: true
  definitions: new_banner|mode|player
  script:
  - choose <[mode]>:
    - case personal:
      - foreach <[player].flag[placed_banners_personal_emblem]>:
        - define facing_direction:<[value].as_location.material.direction>
        - if <[value].as_location.material.contains_any_text[_wall_]>:
          - adjust <[value].as_location> block_type:<[new_banner].before[_banner]>_wall_banner
        - else:
          - adjust <[value].as_location> block_type:<[new_banner].before[_banner]>_banner
        - adjustblock <[value].as_location> direction:<[facing_direction]>
        - adjust <[value].as_location> patterns:<[new_banner].as_item.patterns>
    - case town:
      - foreach <[player].town.flag[placed_banners]>:
        - define facing_direction:<[value].as_location.material.direction>
        - if <[value].as_location.material.contains_any_text[_wall_]>:
          - adjust <[value].as_location> block_type:<[new_banner].before[_banner]>_wall_banner
        - else:
          - adjust <[value].as_location> block_type:<[new_banner].before[_banner]>_banner
        - adjustblock <[value].as_location> direction:<[facing_direction]>
        - adjust <[value].as_location> patterns:<[new_banner].as_item.patterns>
    - case nation:
      - foreach <[player].nation.flag[placed_banners]>:
        - define facing_direction:<[value].as_location.material.direction>
        - if <[value].as_location.material.contains_any_text[_wall_]>:
          - adjust <[value].as_location> block_type:<[new_banner].before[_banner]>_wall_banner
        - else:
          - adjust <[value].as_location> block_type:<[new_banner].before[_banner]>_banner
        - adjustblock <[value].as_location> direction:<[facing_direction]>
        - adjust <[value].as_location> patterns:<[new_banner].as_item.patterns>

Banner_Designer_Reset:
  type: task
  debug: false
  script:
  - flag <player> banner_designer.<[uuid]>.layer:!
  - flag <player> banner_designer.<[uuid]>.pattern:!
  - flag <player> banner_designer.<[uuid]>.color:!
  - adjust <player.flag[banner_designer.<[uuid]>.armor_stand].as_entity> equipment:<list[air|air|air|white_banner]>
  - title "subtitle:<dark_red>Banner Reset" targets:<player> fade_in:5t stay:15t fade_out:2t
  - inject Banner_Designer_Update instantly

Banner_Designer_Crash_Handler:
  type: world
  debug: true
  events:
    on player quits flagged:banner_machine_in_use:
      - define uuid:<player.flag[banner_machine_in_use]>
      - give banner_token_<player.flag[banner_designer.<[uuid]>.mode]>
      - inject Banner_Designer_Update.stop instantly
    after server start:
      - foreach <server.offline_players.filter[has_flag[banner_machine_in_use]]> as:__player:
        - define uuid:<player.flag[banner_machine_in_use]>
        - give banner_token_<player.flag[banner_designer.<[uuid]>.mode]>
        - inject Banner_Designer_Update.stop instantly
      - wait 10s
      - foreach <server.offline_players.filter[has_flag[banner_machine_in_use]]> as:__player:
        - announce "<player.name> is stuck in Banner Machine mode. Tell Berufeng to fix this."

#=====================================================================#
#   ITEMS                                                             #
#=====================================================================#
Banner_Token_Test:
  type: item
  debug: false
  material: gold_nugget
  display name: <dark_gray><bold>[Banner Token: Test]
  lore:
  - Insert in a Banner Designer to enable Testing Mode.

Banner_Token_Town:
  type: item
  debug: false
  material: iron_nugget
  mechanisms:
    custom_model_data: 32
  display name: <blue><bold>[Banner Token: Town]
  lore:
  - Insert in a Banner Designer to edit your town's flag.

Banner_Token_Nation:
  type: item
  debug: false
  material: iron_nugget
  mechanisms:
    custom_model_data: 33
  display name: <gold><bold>[Banner Token: Nation]
  lore:
  - Insert in a Banner Designer to edit your nation's flag.

Banner_Token_Personal:
  type: item
  debug: false
  material: iron_nugget
  mechanisms:
    custom_model_data: 31
  display name: <red><bold>[Banner Token: Personal]
  lore:
  - Insert in a Banner Designer to design your Personal Emblem.

Banner_Token_Single:
  type: item
  debug: false
  material: iron_nugget
  mechanisms:
    custom_model_data: 30
  display name: <dark_gray><bold>[Banner Token: Single Use]
  lore:
  - Insert in a Banner Designer to create a single custom banner.

Banner_Item_Town:
  type: item
  debug: false
  material: blue_banner
  display name: <blue><bold>[Town Flag Banner]
  lore:
  - Use: Place a Town Flag anywhere in your town!

Banner_Item_Nation:
  type: item
  debug: false
  material: yellow_banner
  display name: <gold><bold>[National Flag Banner]
  lore:
  - Use: Place a National Flag anywhere in your nation!

Banner_Item_Personal:
  type: item
  debug: false
  material: red_banner
  display name: <red><bold>[Personal Emblem Banner]
  lore:
  - Use: Place on the ground to display your Personal Emblem!

#=====================================================================#
#    UI ELEMENTS                                                      #
#=====================================================================#
Banner_Designer_Complete_Button:
  type: item
  debug: false
  material: paper
  mechanisms:
    custom_model_data: 1
  display name: <green>Complete

Banner_Designer_Reset_Button:
  type: item
  debug: false
  material: paper
  mechanisms:
    custom_model_data: 5
  display name: <yellow>Reset

Banner_Designer_Exit_Button:
  type: item
  debug: false
  material: barrier
  display name: <dark_red>Exit

Banner_Designer_Arrow_Green:
  type: item
  debug: false
  material: paper
  mechanisms:
    custom_model_data: 6

Banner_Designer_Arrow_Blue:
  type: item
  debug: false
  material: paper
  mechanisms:
    custom_model_data: 7
