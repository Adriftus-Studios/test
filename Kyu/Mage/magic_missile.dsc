impl_skill_magic_missile:
  type: data
  # Internal Name MUST BE UNIQUE
  name: magic_missile

  # Display data used in commands, and GUIs
  display_item_script: impl_skill_magic_missile_icon

  # Skill Tree (uses internal name)
  skill_tree: mage

  # Unlock Requirements are checked when unlocking the ability
  unlock_requirements:
  - "true"

  # Cooldown
  cooldown: 5s

  # Task Script to bee run when the ability is used successfully
  # This Task Script MUST be within this file, as with any code associated with this skill
  on_cast: impl_skill_magic_missile_task

  # Is the ability harmful? (PvP Action)
  harmful: true

  # Does using this ability flag you for PvP if it succeeds (even if not damaging)
  pvp_flags: true

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
    damage: 6
    speed: 2

# Display Icon for the skill itself
# "lore" field might be used in chat diplays, and other GUIs
impl_skill_magic_missile_icon:
  type: item
  material: iron_nugget
  display name: "<&a>Magic Missile"
  lore:
  - "<&b>Shoot a fireball at targets up to 25 blocks away"
  - "<&b>Damages any enemies within its blast radius"
  mechanisms:
    custom_model_data: 6


# The On Cast Task script has specific requirements, and limits
# The only reliable context tags in this task will be `<player>`
# The task must `determine` true or false if the ability was successful or not.
impl_skill_magic_missile_task:
  type: task
  debug: false
  definitions: target
  script:
    - shoot arrow origin:<player> speed:<script[impl_skill_magic_missile].parsed_key[balance.speed]> shooter:<player> save:shot
    - adjust <entry[shot].shot_entity> hide_from_players
    - determine passively true
    - flag <entry[shot].shot_entity> on_hit_entity:impl_skill_magic_missile_damage_task
    - flag <entry[shot].shot_entity> on_hit_block:impl_skill_magic_missile_remove_task
    - while <entry[shot].shot_entity.is_spawned>:
      - playeffect at:<entry[shot].shot_entity.location> effect:end_rod quantity:8 offset:0.1
      - wait 2t

impl_skill_magic_missile_damage_task:
  type: task
  debug: false
  script:
    - hurt <script[impl_skill_magic_missile].parsed_key[balance.damage]> <context.hit_entity> cause:ENTITY_ATTACK source:<player>
    - remove <context.projectile>
impl_skill_magic_missile_remove_task:
  type: task
  debug: false
  script:
    - remove <context.projectile>