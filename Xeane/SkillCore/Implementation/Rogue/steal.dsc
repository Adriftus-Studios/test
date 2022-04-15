impl_skill_steal:
  type: data
  # Internal Name MUST BE UNIQUE
  name: steal

  # Display data used in commands, and GUIs
  display_item_script: impl_skill_steal_icon

  # Skill Tree (uses internal name)
  skill_tree: rogue

  # Unlock Requirements are checked when unlocking the ability
  unlock_requirements:
  - "true"

  # Cooldown
  cooldown: 1m

  # Task Script to bee run when the ability is used successfully
  # This Task Script MUST be within this file, as with any code associated with this skill
  on_cast: impl_skill_steal_task

  # Is the ability harmful? (PvP Action)
  harmful: false

  # Does using this ability flag you for PvP if it succeeds (even if not damaging)
  pvp_flags: false

  # Can you use this in combat
  pvp_usable: false

  # Skill Targetting
  # these tags will be parsed to determine targets
  # Only available context is <player>
  targetting_tags:
  - "<player.precise_target[2].if_null[<player.cursor_on[2].if_null[null]>]>"

  # Messages are parsed in the script, use tags for colors
  # Each script should make a list in this comment for available context
  messages:
    # Every script should have `no_target` value, unless it is a self target
    no_target: "<&c>You have no valid targets."

# Display Icon for the skill itself
# "lore" field might be used in chat diplays, and other GUIs
impl_skill_steal_icon:
  type: item
  material: iron_nugget
  display name: "<&a>Steal"
  lore:
  - "<&b>Steal an Item!"
  - "<&e>Takes last item in Target"
  - "<&e>Range 2 blocks"
  mechanisms:
    custom_model_data: 9


# The On Cast Task script has specific requirements, and limits
# The only reliable context tags in this task will be `<player>`
# The task must `determine` true or false if the ability was successful or not.
impl_skill_steal_task:
  type: task
  debug: false
  definitions: targets
  script:
      - define inventory <[targets].inventory.if_null[null]>
      - if <[inventory]> == null:
        - narrate "<&c>Invalid Target."
        - determine false
      - define map_slots <[inventory].map_slots>
      - if <[map_slots].is_empty>:
        - narrate "<&c>Inventory is empty."
        - determine false
      - else:
        - choose <[inventory].inventory_type>:
          - case PLAYER:
            - define slot <[map_slots].keys.exclude[41|40|39|38|37].last.if_null[false]>
            - if <[slot]> < 10 || !<[slot].is_truthy>:
              - narrate "<&c>Player has no items to steal"
              - determine false
            - define item <[inventory].slot[<[slot]>]>
            - narrate "<player.name><&e> has stolen <&b><[item].formatted><&e> from you." targets:<[inventory].id_holder>
          - case FURNACE:
            - if <[inventory].slot[3].material.name> == air:
              - narrate "<&c>Player has no items to steal"
              - determine false
            - define slot 3
            - define item <[inventory].slot[3]>
          - case CHEST:
            - define slot <[map_slots].keys.last>
            - define item <[inventory].slot[<[slot]>]>
        - inventory set slot:<[slot]> d:<[inventory]> o:air
        - give <[item]>
        - narrate "<&a>You succesfully stole<&co> <&e><[item].formatted>"
