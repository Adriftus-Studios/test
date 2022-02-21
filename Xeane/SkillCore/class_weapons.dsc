# Internal Stuff #
class_weapon_inventory:
  type: inventory
  debug: false
  inventory: chest
  size: 54
  gui: true
  slots:
    - [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler]
    - [standard_filler] [standard_filler] [] [] [] [] [standard_filler] [standard_filler] [standard_filler]
    - [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler]
    - [standard_filler] [standard_filler] [] [] [] [] [standard_filler] [standard_filler] [standard_filler]
    - [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler]
    - [standard_filler] [standard_filler] [] [] [] [] [standard_filler] [standard_filler] [standard_filler]

#/# Test for script meta parser
class_weapon_hotkey_button:
  type: item
  debug: false
  material: feather
  flags:
    run_script: class_weapon_click_handler

#/
# Test for script meta parser
#/
class_weapon_open:
  type: task
  debug: false
  data:
    hotkeys:
      - "Left"
      - "Right"
      - "Drop"
      - "Swap"
      - "Crouch_Left"
      - "Crouch_Right"
      - "Crouch_Drop"
      - "Crouch_Swap"
      - "Run_Left"
      - "Run_Right"
      - "Run_Drop"
      - "Run_Swap"
    item_format:
      display: <&a><[hotkey_button]>
      lore:
        - "<&a>Lore For <[hotkey_button]> Goes Here"
  script:
    - define inventory <inventory[class_weapon_inventory]>
    - foreach <script.data_key[data.hotkeys]> as:hotkey_button:
      - define map <script.parsed_key[data.item_format]>
      - define mechanisms <[map].keys.parse_tag[<[parse_value]>=<[map].get[<[parse_value]>]>].separated_by[;]>
      - if !<player.has_flag[hotkeys.<[hotkey_button]>]>:
        - define items:->:<item[class_weapon_hotkey_button].with[<[mechanisms]>].with_flag[hotkey:<[hotkey_button]>]>
      - else:
        - define skill_script <server.flag[skills.abilities.<player.flag[hotkeys.<[hotkey_button]>]>]>
        - define item <item[<[skill_script].data_key[display_item_script]>]>
        - flag <[item]> hotkey:<[hotkey_button]>
        - flag <[item]> run_script:class_weapon_click_handler
        - adjust def:item "lore:<[item].lore.include[<&c>--------------|<&b>Right Click to Unbind]>"
        - define items:->:<[item]>
    - give <[items]> to:<[inventory]>
    - inventory open d:<[inventory]>

class_weapon_click_handler:
  type: task
  debug: false
  script:
    - define hotkey <context.item.flag[hotkey]>
    - if <context.click> == LEFT:
      - inject class_weapon_ability_selection_open
    - if <context.click> == RIGHT:
      - inject class_weapon_clear_hotkey

class_weapon_clear_hotkey:
  type: task
  debug: false
  definitions: hotkey
  script:
    - flag player hotkeys.<[hotkey]>:!
    - run class_weapon_open

class_weapon_ability_selection:
  type: inventory
  debug: false
  inventory: chest
  size: 54
  gui: true
  slots:
    - [] [standard_filler] [] [standard_filler] [] [standard_filler] [] [standard_filler] []
    - [] [standard_filler] [standard_filler] [standard_filler] [] [standard_filler] [standard_filler] [standard_filler] []
    - [standard_filler] [] [] [] [] [] [] [] [standard_filler]
    - [standard_filler] [] [] [] [] [] [] [] [standard_filler]
    - [standard_filler] [] [] [] [] [] [] [] [standard_filler]
    - [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler]

#/#
#/# Script Meta testing
#/# Permissions: adriftus.moderator, adriftus.admin
#/#
class_weapon_ability_selection_open:
  type: task
  debug: false
  definitions: hotkey
  script:
    - define inventory <inventory[class_weapon_ability_selection]>
    - inventory set slot:46 destination:<[inventory]> origin:<item[standard_filler].with_flag[hotkey:<[hotkey]>]>
    - define items:!|:<player.flag[skills.trees].keys.pad_right[5].with[filler].parse[proc[class_weapon_skilltree_item]]>
    - foreach <list[staff|moderator|admin]> as:rank:
      # TODO Fix later
      - define items:->:<item[standard_filler].with_flag[unique:<util.random_uuid>]>
      - foreach next
      - if <player.has_permission[adriftus.<[rank]>]>:
        - define items:->:<element[<[rank]>].proc[class_weapon_skilltree_item]>
      - else:
        - define items:->:<item[standard_filler]>
    - if <player.has_flag[skills.trees]> && <player.flag[skills.trees].size> > 0:
      - define first <player.flag[skills.trees].keys.first>
      - if !<player.flag[skills.trees.<[first]>].keys.is_empty>:
        - define items:|:<player.flag[skills.trees.<[first]>].keys.parse[proc[class_weapon_ability_item]]>
    - give <[items]> to:<[inventory]>
    - inventory open d:<[inventory]>

#/#
#/#
#/#
class_weapon_skilltree_item:
  type: procedure
  debug: false
  definitions: input
  script:
    - if <[input]> == filler:
        - determine <item[standard_filler].with_flag[unique:<util.random_uuid>]>
    - define skillTree_script <server.flag[skills.trees.<[input]>.script]>
    - determine <item[<[skillTree_script].data_key[display_item_script]>]>

#/#
#/#
#/#
class_weapon_ability_item:
  type: procedure
  debug: false
  definitions: input
  script:
    - define skill_script <server.flag[skills.abilities.<[input]>]>
    - define item <item[<[skill_script].data_key[display_item_script]>].with_flag[skill:<[skill_script].data_key[name]>].with_flag[run_script:class_weapon_set_skill]>
    - determine <[item]>

class_weapon_set_skill:
  type: task
  debug: false
  script:
    - define hotkey <context.inventory.slot[46].flag[hotkey]>
    - define skill <context.item.flag[skill]>
    - flag player hotkeys.<[hotkey]>:<[skill]>
    - run class_weapon_open