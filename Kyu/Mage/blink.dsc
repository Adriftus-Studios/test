impl_skill_blink:
  type: data
  # Internal Name MUST BE UNIQUE
  name: blink

  # Display data used in commands, and GUIs
  display_item_script: impl_skill_blink_icon

  # Skill Tree (uses internal name)
  skill_tree: mage

  # Unlock Requirements are checked when unlocking the ability
  unlock_requirements:
  - "true"

  # Cooldown
  cooldown: 8s

  # Task Script to bee run when the ability is used successfully
  # This Task Script MUST be within this file, as with any code associated with this skill
  on_cast: impl_skill_blink_task

  # Is the ability harmful? (PvP Action)
  harmful: false

  # Does using this ability flag you for PvP if it succeeds (even if not damaging)
  pvp_flags: false

  # Skill Targetting
  # these tags will be parsed to determine targets
  # Only available context is <player>
  targetting_tags:
  - "none"

  # Messages are parsed in the script, use tags for colors
  # Each script should make a list in this comment for available context
  messages:
    # Every script should have `no_target` value, unless it is a self target
    no_target: "<&c>You have no target within range."

  # Balance Values used in the script
  balance:
    distance: 5

# Display Icon for the skill itself
# "lore" field might be used in chat diplays, and other GUIs
impl_skill_blink_icon:
  type: item
  material: iron_nugget
  display name: "<&a>Blink"
  lore:
  - "<&b>Teleport 5 blocks directly ahead of you"
  mechanisms:
    custom_model_data: 7


# The On Cast Task script has specific requirements, and limits
# The only reliable context tags in this task will be `<player>`
# The task must `determine` true or false if the ability was successful or not.
impl_skill_blink_task:
  type: task
  debug: false
  definitions: target
  script:
    - define target <player.location.with_pitch[0].precise_cursor_on[5].if_null[null]>
    - if <[target]> == null || !<[target].material.is_solid>:
      - teleport <player.location.with_pitch[0].forward[5]>
    - else if <[target].above.material.is_solid.not> && <[target].material.is_solid>:
      - teleport <[target].above>
    - else if <[target].above.material.is_solid> && <[target].material.is_solid>:
      - teleport <[target].above.backward>
    - determine true
