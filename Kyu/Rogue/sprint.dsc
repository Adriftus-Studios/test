impl_skill_sprint:
  type: data
  # Internal Name MUST BE UNIQUE
  name: sprint

  # Display data used in commands, and GUIs
  display_item_script: impl_skill_sprint_icon

  # Skill Tree (uses internal name)
  skill_tree: rogue

  # Unlock Requirements are checked when unlocking the ability
  unlock_requirements:
  - "true"

  # Cooldown
  cooldown: 12s

  # Task Script to bee run when the ability is used successfully
  # This Task Script MUST be within this file, as with any code associated with this skill
  on_cast: impl_skill_sprint_task

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
    duration: 2s
    level: 4

# Display Icon for the skill itself
# "lore" field might be used in chat diplays, and other GUIs
impl_skill_sprint_icon:
  type: item
  material: iron_nugget
  display name: "<&a>Sprint"
  lore:
  - "<&b>Gain a short burst of speed"
  mechanisms:
    custom_model_data: 15


# The On Cast Task script has specific requirements, and limits
# The only reliable context tags in this task will be `<player>`
# The task must `determine` true or false if the ability was successful or not.
impl_skill_sprint_task:
  type: task
  debug: false
  definitions: target
  script:
    - if <player.is_on_ground>:
      # Effect Level 5.
      - cast speed duration:<script[impl_skill_sprint].parsed_key[balance.duration]> amplifier:<script[impl_skill_sprint].parsed_key[balance.level]> no_ambient hide_particles no_icon
      - playsound <player.location> sound:ENTITY_SPLASH_POTION_BREAK volume:5.0 sound_category:players
      - determine true
    - determine false
