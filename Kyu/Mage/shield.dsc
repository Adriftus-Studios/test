impl_skill_shield:
  type: data
  # Internal Name MUST BE UNIQUE
  name: shield

  # Display data used in commands, and GUIs
  display_item_script: impl_skill_shield_icon

  # Skill Tree (uses internal name)
  skill_tree: mage

  # Unlock Requirements are checked when unlocking the ability
  unlock_requirements:
  - "true"

  # Cooldown
  # True Cooldown = cooldown - duration = 18s - 3s = 15s
  cooldown: 18s

  # Task Script to bee run when the ability is used successfully
  # This Task Script MUST be within this file, as with any code associated with this skill
  on_cast: impl_skill_shield_task

  # Is the ability harmful? (PvP Action)
  harmful: false

  # Does using this ability flag you for PvP if it succeeds (even if not damaging)
  pvp_flags: false

  # Skill Targetting
  # these tags will be parsed to determine targets
  # Only available context is <player>
  targetting_tags:
  - "<player>"

  # Messages are parsed in the script, use tags for colors
  # Each script should make a list in this comment for available context
  messages:
    # Every script should have `no_target` value, unless it is a self target
    no_target: "<&c>You have no target within range."

  # Balance Values used in the script
  balance:
    duration: 3

# Display Icon for the skill itself
# "lore" field might be used in chat diplays, and other GUIs
impl_skill_shield_icon:
  type: item
  material: feather
  display name: "<&a>Shield"
  lore:
  - "<&b>Shield yourself from incoming damage for 3 seconds"
  mechanisms:
    custom_model_data: 3


# The On Cast Task script has specific requirements, and limits
# The only reliable context tags in this task will be `<player>`
# The task must `determine` true or false if the ability was successful or not.
impl_skill_shield_task:
  type: task
  debug: false
  definitions: target
  script:
    # Effect Level 10. A level of 5 and above gives full immunity to all damage. (Minecraft Wiki)
    - cast damage_resistance duration:<script[impl_skill_shield].parsed_key[balance.duration]> amplifier:9 no_ambient hide_particles no_icon
    - determine true
