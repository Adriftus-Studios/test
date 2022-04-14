impl_skill_iron_climbing:
  type: data
  # Internal Name MUST BE UNIQUE
  name: iron_climbing

  # Display data used in commands, and GUIs
  display_item_script: impl_skill_iron_climbing_icon

  # Skill Tree (uses internal name)
  skill_tree: rogue

  # Unlock Requirements are checked when unlocking the ability
  unlock_requirements:
  - "true"

  # Cooldown
  cooldown: 10s

  # Task Script to bee run when the ability is used successfully
  # This Task Script MUST be within this file, as with any code associated with this skill
  on_cast: impl_skill_iron_climbing_task

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
  - "<player>"

  # Messages are parsed in the script, use tags for colors
  # Each script should make a list in this comment for available context
  messages:
    # Every script should have `no_target` value, unless it is a self target
    no_target: "<&c>You have no valid targets."

# Display Icon for the skill itself
# "lore" field might be used in chat diplays, and other GUIs
impl_skill_iron_climbing_icon:
  type: item
  material: iron_nugget
  display name: "<&a>Iron Climbing"
  lore:
  - "<&b>Activates climbing iron bars"
  - "<&e>Lasts until you log out"
  mechanisms:
    custom_model_data: 9


# The On Cast Task script has specific requirements, and limits
# The only reliable context tags in this task will be `<player>`
# The task must `determine` true or false if the ability was successful or not.
impl_skill_iron_climbing_task:
  type: task
  debug: false
  definitions: targets
  script:
    - climbable material:iron_bars true targets:<player>
    - determine true
