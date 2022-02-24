impl_skill_disengage:
  type: data
  # Internal Name MUST BE UNIQUE
  name: disengage

  # Display data used in commands, and GUIs
  display_item_script: impl_skill_disengage_icon

  # Skill Tree (uses internal name)
  skill_tree: ranger

  # Unlock Requirements are checked when unlocking the ability
  unlock_requirements:
  - "true"

  # Cooldown
  cooldown: 8s

  # Task Script to bee run when the ability is used successfully
  # This Task Script MUST be within this file, as with any code associated with this skill
  on_cast: impl_skill_disengage_task

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
    distance: 1
    speed: 1

# Display Icon for the skill itself
# "lore" field might be used in chat diplays, and other GUIs
impl_skill_disengage_icon:
  type: item
  material: iron_nugget
  display name: "<&a>Disengage"
  lore:
  - "<&b>Leap backwards to put some distance between yourself and your enemies"
  mechanisms:
    custom_model_data: 19


# The On Cast Task script has specific requirements, and limits
# The only reliable context tags in this task will be `<player>`
# The task must `determine` true or false if the ability was successful or not.
impl_skill_disengage_task:
  type: task
  debug: false
  definitions: target
  script:
    - adjust <player> velocity:<player.location.with_pitch[35].sub[<player.location.with_pitch[35].backward>]>
    - determine true
