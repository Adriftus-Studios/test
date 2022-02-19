impl_skill_explosive_arrow:
  type: data
  # Internal Name MUST BE UNIQUE
  name: explosive_arrow

  # Display data used in commands, and GUIs
  display_item_script: impl_skill_explosive_arrow_icon

  # Skill Tree (uses internal name)
  skill_tree: ranger

  # Unlock Requirements are checked when unlocking the ability
  unlock_requirements:
  - "true"

  # Cooldown
  cooldown: 10s

  # Task Script to bee run when the ability is used successfully
  # This Task Script MUST be within this file, as with any code associated with this skill
  on_cast: impl_skill_explosive_arrow_task

  # Is the ability harmful? (PvP Action)
  harmful: true

  # Does using this ability flag you for PvP if it succeeds (even if not damaging)
  pvp_flags: true

  # Skill Targetting
  # these tags will be parsed to determine targets
  # Only available context is <player>
  targetting_tags:
  - "<player.cursor_on_solid[20]>"

  # Messages are parsed in the script, use tags for colors
  # Each script should make a list in this comment for available context
  messages:
    # Every script should have `no_target` value, unless it is a self target
    no_target: "<&c>You have no target within range."

  # Balance Values used in the script
  balance:
    power: 3
    speed: 5

# Display Icon for the skill itself
# "lore" field might be used in chat diplays, and other GUIs
impl_skill_explosive_arrow_icon:
  type: item
  material: feather
  display name: "<&a>Explosive Arrow"
  lore:
  - "<&b>Shoot an explosive arrow at targets up to 20 blocks away"
  mechanisms:
    custom_model_data: 2


# The On Cast Task script has specific requirements, and limits
# The only reliable context tags in this task will be `<player>`
# The task must `determine` true or false if the ability was successful or not.
impl_skill_explosive_arrow_task:
  type: task
  debug: false
  definitions: target
  script:
    - shoot arrow origin:<player> destination:<[target]> speed:<script[impl_skill_explosive_arrow].parsed_key[balance.speed]> script:impl_skill_explosive_arrow_damage_task shooter:<player>
    - determine true

impl_skill_explosive_arrow_damage_task:
  type: task
  debug: false
  script:
    - explode power:<script[impl_skill_explosive_arrow].parsed_key[balance.power]> <[location]> breakblocks source:<player>
