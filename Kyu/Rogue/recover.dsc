impl_skill_recover:
  type: data
  # Internal Name MUST BE UNIQUE
  name: recover

  # Display data used in commands, and GUIs
  display_item_script: impl_skill_recover_icon

  # Skill Tree (uses internal name)
  skill_tree: rogue

  # Unlock Requirements are checked when unlocking the ability
  unlock_requirements:
  - "true"

  # Cooldown
  cooldown: 20s

  # Task Script to bee run when the ability is used successfully
  # This Task Script MUST be within this file, as with any code associated with this skill
  on_cast: impl_skill_recover_task

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
    duration: 3s
    level: 3

# Display Icon for the skill itself
# "lore" field might be used in chat diplays, and other GUIs
impl_skill_recover_icon:
  type: item
  material: iron_nugget
  display name: "<&a>Recover"
  lore:
  - "<&b>Recover some health after a short warmup"
  - "<&b>This skill is interruptible if you take damage or move"
  mechanisms:
    custom_model_data: 16


# The On Cast Task script has specific requirements, and limits
# The only reliable context tags in this task will be `<player>`
# The task must `determine` true or false if the ability was successful or not.
impl_skill_recover_task:
  type: task
  debug: false
  definitions: target
  script:
    - define health <player.health>
    - define location <player.location>
    - wait 3s
    - if <player.health> < <[health]> || !<player.location.equals[<[location]>]>:
      - determine false
    # Level 4 Regeneration. 6 ticks per half-heart (1 HP). 3.33 Half-hearts per second (2 HP * 1.665) (Minecraft Wiki)
    - cast regeneration duration:<script[impl_skill_recover].parsed_key[balance.duration]> amplifier:<script[impl_skill_recover].parsed_key[balance.level]> no_ambient hide_particles no_icon
    - determine true
