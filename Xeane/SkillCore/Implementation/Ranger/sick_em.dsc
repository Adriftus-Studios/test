impl_skill_sick_em:
  type: data
  # Internal Name MUST BE UNIQUE
  name: sick_em

  # Display data used in commands, and GUIs
  display_item_script: impl_skill_sick_em_icon

  # Skill Tree (uses internal name)
  skill_tree: ranger

  # Unlock Requirements are checked when unlocking the ability
  unlock_requirements:
  - "true"

  # Cooldown
  cooldown: 30s

  # Task Script to bee run when the ability is used successfully
  # This Task Script MUST be within this file, as with any code associated with this skill
  on_cast: impl_skill_sick_em_task

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
  - "<player.target||null>"

  # Messages are parsed in the script, use tags for colors
  # Each script should make a list in this comment for available context
  messages:
    # Every script should have `no_target` value, unless it is a self target
    no_target: "<&c>You have no target within range."

  # Balance Values used in the script
  balance:
    health: 20

# Display Icon for the skill itself
# "lore" field might be used in chat diplays, and other GUIs
impl_skill_sick_em_icon:
  type: item
  material: iron_nugget
  display name: "<&a>Sick 'em!"
  lore:
  - "<&b>Summon a wolf to assist you in battle"
  mechanisms:
    custom_model_data: 21


# The On Cast Task script has specific requirements, and limits
# The only reliable context tags in this task will be `<player>`
# The task must `determine` true or false if the ability was successful or not.
impl_skill_sick_em_task:
  type: task
  debug: false
  definitions: target
  script:
    - if <[target]> == null:
      - determine false
    - define entity <entity[impl_skill_sick_em_entity].with[custom_name=<&a><player.name><&sq>s<&sp>Wolf;tame=true;owner=<player>]>
    - spawn <[entity]> <player.location> target:<[target]> save:ent
    - playsound <player.location> sound:ENTITY_WOLF_GROWL volume:5.0 sound_category:players
    - determine passively true
    - wait 10s
    - if <entry[ent].spawned_entity.exists>:
      - remove <entry[ent].spawned_entity>

impl_skill_sick_em_entity:
  type: entity
  debug: false
  entity_type: wolf
  mechanisms:
    speed: 0.4
    health_data: <script[impl_skill_sick_em].parsed_key[balance.health]>/<script[impl_skill_sick_em].parsed_key[balance.health]>
