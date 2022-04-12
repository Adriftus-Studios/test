impl_skill_treetop_leap:
  type: data
  # Internal Name MUST BE UNIQUE
  name: treetop_leap

  # Display data used in commands, and GUIs
  display_item_script: impl_skill_treetop_leap_icon

  # Skill Tree (uses internal name)
  skill_tree: ranger

  # Unlock Requirements are checked when unlocking the ability
  unlock_requirements:
  - "true"

  # Cooldown
  cooldown: 3s

  # Task Script to bee run when the ability is used successfully
  # This Task Script MUST be within this file, as with any code associated with this skill
  on_cast: impl_skill_treetop_leap_task

  # Is the ability harmful? (PvP Action)
  harmful: false

  # Does using this ability flag you for PvP if it succeeds (even if not damaging)
  pvp_flags: false

  # Skill Targetting
  # these tags will be parsed to determine targets
  # Only available context is <player>
  targetting_tags:
  - "<player"

  # Messages are parsed in the script, use tags for colors
  # Each script should make a list in this comment for available context
  messages:
    # Every script should have `no_target` value, unless it is a self target
    no_target: "<&c>You have no valid targets."

# Display Icon for the skill itself
# "lore" field might be used in chat diplays, and other GUIs
impl_skill_treetop_leap_icon:
  type: item
  material: iron_nugget
  display name: "<&a>Treetop Leap"
  lore:
  - "<&b>Leap far when standing on leaves"
  mechanisms:
    custom_model_data: 9


# The On Cast Task script has specific requirements, and limits
# The only reliable context tags in this task will be `<player>`
# The task must `determine` true or false if the ability was successful or not.
impl_skill_treetop_leap_task:
  type: task
  debug: false
  definitions: targets
  script:
    - if <player.location.below.material.name.ends_with[leaves]>:
      - adjust <player> velocity:<player.location.direction.vector.mul[1.5]>
      - flag player no_fall_damage_once expire:10s
      - determine true
    - narrate "<&e>You must be standing on leaves to use this skill."
    - determine false
