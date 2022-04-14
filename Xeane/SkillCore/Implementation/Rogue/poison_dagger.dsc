impl_skill_poison_dagger:
  type: data
  # Internal Name MUST BE UNIQUE
  name: poison_dagger

  # Display data used in commands, and GUIs
  display_item_script: impl_skill_poison_dagger_icon

  # Skill Tree (uses internal name)
  skill_tree: rogue

  # Unlock Requirements are checked when unlocking the ability
  unlock_requirements:
  - "true"

  # Cooldown
  cooldown: 20s

  # Task Script to bee run when the ability is used successfully
  # This Task Script MUST be within this file, as with any code associated with this skill
  on_cast: impl_skill_poison_dagger_task

  # Is the ability harmful? (PvP Action)
  harmful: true

  # Does using this ability flag you for PvP if it succeeds (even if not damaging)
  pvp_flags: true

  # Can you use this in combat
  pvp_usable: true

  # Skill Targetting
  # these tags will be parsed to determine targets
  # Only available context is <player>
  targetting_tags:
  - "<player.precise_target[20]||null>"

  # Messages are parsed in the script, use tags for colors
  # Each script should make a list in this comment for available context
  messages:
    # Every script should have `no_target` value, unless it is a self target
    no_target: "<&c>You have no target within range."

  # Balance Values used in the script
  balance:
    speed: 5
    damage: 4
    duration: 10s

# Display Icon for the skill itself
# "lore" field might be used in chat diplays, and other GUIs
impl_skill_poison_dagger_icon:
  type: item
  material: iron_nugget
  display name: "<&a>Poison Dagger"
  lore:
  - "<&b>Throw a poison-tipped knife at your enemies from up to 20 blocks away"
  - "<&b>Deals damage and poisons them if it lands"
  mechanisms:
    custom_model_data: 17


# The On Cast Task script has specific requirements, and limits
# The only reliable context tags in this task will be `<player>`
# The task must `determine` true or false if the ability was successful or not.
impl_skill_poison_dagger_task:
  type: task
  debug: false
  definitions: target
  script:
    - playeffect effect:spell_witch at:<player.eye_location.points_between[<player.precise_target_position>].distance[0.33]> quantity:5 offset:0.1
    - playsound <player.location> sound:ENTITY_WITCH_THROW volume:5.0 sound_category:players
    - hurt <[target]> <script[impl_skill_poison_dagger].parsed_key[balance.damage]> cause:ENTITY_ATTACK source:<player>
    # Level 1 Poison. 25 ticks per half-heart (1 HP). 0.8 Half-hearts per second (2 HP * 0.4) (Minecraft Wiki)
    - cast poison <[target]> duration:<script[impl_skill_poison_dagger].parsed_key[balance.duration]> amplifier:0
    - determine true
