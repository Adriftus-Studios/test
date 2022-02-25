impl_skill_stealth:
  type: data
  # Internal Name MUST BE UNIQUE
  name: stealth

  # Display data used in commands, and GUIs
  display_item_script: impl_skill_stealth_icon

  # Skill Tree (uses internal name)
  skill_tree: rogue

  # Unlock Requirements are checked when unlocking the ability
  unlock_requirements:
  - "true"

  # Cooldown
  cooldown: 35s

  # Task Script to bee run when the ability is used successfully
  # This Task Script MUST be within this file, as with any code associated with this skill
  on_cast: impl_skill_stealth_task

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
    duration: 25s

# Display Icon for the skill itself
# "lore" field might be used in chat diplays, and other GUIs
impl_skill_stealth_icon:
  type: item
  material: iron_nugget
  display name: "<&a>Stealth"
  lore:
  - "<&b>Turn invisible to ambush your enemies or escape"
  - "<&b>This skill will be interrupted if you take damage"
  mechanisms:
    custom_model_data: 16


# The On Cast Task script has specific requirements, and limits
# The only reliable context tags in this task will be `<player>`
# The task must `determine` true or false if the ability was successful or not.
impl_skill_stealth_task:
  type: task
  debug: false
  definitions: target
  script:
    - cast invisibility duration:<script[impl_skill_stealth].parsed_key[balance.duration]> amplifier:0 no_ambient hide_particles no_icon
    - fakeequip <player> for:<server.online_players.remove[<player>]> head:air chest:air legs:air boots:air offhand:air hand:air duration:<script[impl_skill_stealth].parsed_key[balance.duration]>
    - flag <player> on_next_damage:impl_skill_stealth_task_remove
    - determine true

impl_skill_stealth_task_remove:
  type: task
  debug: false
  script:
    - flag <player> invisibility_once:!
    - cast invisibility remove <player>
    - fakeequip <player> reset
