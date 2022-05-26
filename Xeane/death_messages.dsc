player_death_handler:
  type: world
  debug: false
  data:
    death_info:
      - "<&e>Location<&co> <player.location.simple>"
      - "<&e>Time of Death<&co> <util.time_now.format>"
      - "<&a>Click to open a Portal"
  events:
    on player dies bukkit_priority:HIGHEST:
      # Check for Custom Damage Messages
      - if <context.cause> == CUSTOM:
        - define message "<proc[get_player_display_name]><&e> was killed by <player.flag[custom_damage]>"
        - flag <context.entity> custom_damage:!
      - else:
        - choose <context.cause>:
          # Block Explosion - Damage caused by being in the area when a block explodes.
          - case BLOCK_EXPLOSION:
            - define message "<proc[get_player_display_name]><&e> cut the wrong wire on the bomb"

          # Contact - Damage caused when an entity contacts a block such as a Cactus, Dripstone (Stalagmite) or Berry Bush.
          - case CONTACT:
            - define message "<proc[get_player_display_name]><&e> died to a pointy object"

          # Entity Attack - Damage caused when an entity attacks another entity.
          - case ENTITY_ATTACK ENTITY_SWEEP_ATTACK:
            # Player vs Player
            - if <context.damager.entity_type> == PLAYER:
              - define item <context.damager.item_in_hand.display.if_null[<context.damager.item_in_hand.material.translated_name>]>
              - define message "<proc[get_player_display_name].context[<context.entity>]><&e> was slain by <proc[get_player_display_name].context[<context.damager>]><&e> with <[item].on_hover[<context.damager.item_in_hand>].type[SHOW_ITEM]>"
            # Mythic Mob
            - else if <context.damager.is_mythicmob>:
              - define message "<proc[get_player_display_name]><&e> got mythically annihilated by <context.damager.mythicmob.display_name>"

            # Everything Else
            - else:
              - if <context.damager.custom_name.exists>:
                - define name <context.damager.custom_name>
              - else:
                - define name <context.damager.entity_type.replace[_].with[<&sp>].to_titlecase>
              - define message "<proc[get_player_display_name]><&e> was slain by <&c><[name]>"
          - case PROJECTILE:
            - define message "<proc[get_player_display_name]><&e> got shot in the face by <context.damager>"

          # Fall - Damage caused when an entity falls a distance greater than 3 blocks
          - case FALL:
            - define message "<proc[get_player_display_name]><&e> learned about gravity, the hard way"

          # Suffocation - Damage caused by being put in a block
          - case SUFFOCATION:
            - define message "<proc[get_player_display_name]><&e> died very quietly.... encased in blocks"

          # Fire Tick - Damage caused by direct exposure to fire
          - case FIRE FIRE_TICK:
            - define message "<proc[get_player_display_name]><&e> died a horrible, fiery death"

          # Melting - Damage caused due to a snowman melting
          - case Melting:
            - define message "<proc[get_player_display_name]><&e> melted away, pathetically.."

          # Lava - Damage caused by direct exposure to lava
          - case LAVA:
            - define message "<proc[get_player_display_name]><&e> went swimming in lava without protection"

          # DROWNING - Damage caused by running out of air while in water
          - case DROWNING:
            - define message "<proc[get_player_display_name]><&e> forgot they couldn't breathe underwater"

          # ENTITY_EXPLOSION - Damage caused by being in the area when an entity, such as a Creeper, explodes.
          - case ENTITY_EXPLOSION:
            - define message "<proc[get_player_display_name]><&e> got a little bit exploded"

          # VOID - Damage caused by falling into the void
          - case VOID:
            - define message "<proc[get_player_display_name]><&e> stared into the void, and the void stared back"

          # LIGHTNING - Damage caused by being struck by lightning
          - case LIGHTNING:
            - define message "<proc[get_player_display_name]><&e> just had a... shocking moment"

          # SUICIDE - Damage caused by committing suicide.
          - case SUICIDE:
            - define message "<proc[get_player_display_name]><&e> made a poor life decision"

          # STARVATION - Damage caused by starving due to having an empty hunger bar
          - case STARVATION:
            - define message "<proc[get_player_display_name]><&e> starved to death"

          # POISON - Damage caused due to an ongoing poison effect
          - case POISON:
            - define message "<proc[get_player_display_name]><&e> has succumb to fatal poisoning"

          # MAGIC - Damage caused by being hit by a damage potion or spell
          - case POISON:
            - define message "<proc[get_player_display_name]><&e> was killed by mystical forces"

          # WITHER - Damage caused by Wither potion effect
          - case WITHER:
            - define message "<proc[get_player_display_name]><&e> withered away"

          # FALLING_BLOCK - Damage caused by being hit by a falling block which deals damage
          - case WITHER:
            - define message "<proc[get_player_display_name]><&e> got hit in the head by a large block"

          # FALLING_BLOCK - Damage caused by being hit by a falling block which deals damage
          - case FALLING_BLOCK:
            - define message "<proc[get_player_display_name]><&e> was killed by a large block to the head"

          # FALLING_BLOCK - Damage caused in retaliation to another attack by the Thorns enchantment.
          - case THORNS:
            - define message "<proc[get_player_display_name]><&e> died to their own wrath"

          # DRAGON_BREATH - Damage caused by a dragon breathing fire.
          - case THORNS:
            - define message "<proc[get_player_display_name]><&e> died to find out the Dragon really needs a breath mint."

          # FLY_INTO_WALL - Damage caused when an entity runs into a wall.
          - case THORNS:
            - define message "<proc[get_player_display_name]><&e> got a crash course in inertia"

          # HOT_FLOOR - Damage caused when an entity steps on MAGMA_BLOCK.
          - case HOT_FLOOR:
            - define message "<proc[get_player_display_name]><&e> died due to excessive hot foot"

          # CRAMMING - Damage caused when an entity is colliding with too many entities due to the maxEntityCramming game rule.
          - case CRAMMING:
            - define message "<proc[get_player_display_name]><&e> was squished to death in a pile of mobs"

          # DRYOUT - Damage caused when an entity that should be in water is not.
          - case DRYOUT:
            - define message "<proc[get_player_display_name]><&e> died due to beinga fish out of water"

          # FREEZE - Damage caused from freezing.
          - case FREEZE:
            - define message "<proc[get_player_display_name]><&e> froze to death"
      - determine passively NO_MESSAGE
      - define players_final "<&font[adriftus:chat]><&chr[2001]><&r> <&7><&lb><&4>DEATH<&7><&rb><&r><&nl>     <[message]>"
      - define staff_final "<&font[adriftus:chat]><&chr[2001]><&r> <&7><&lb><&4>DEATH<&7><&rb><&r> - <element[<&7><&lb><&d>Moderation Information<&7><&rb>].on_hover[<script.parsed_key[data.death_info].separated_by[<&nl>]>].on_click[/dtd forward_portal coordinates <player.location.x> <player.location.y> <player.location.z>].type[RUN_COMMAND]><&nl>     <[message]>"
      - define staff <server.online_players.filter[has_permission[adriftus.staff]]>
      - define players <server.online_players.exclude[<[staff]>]>
      - narrate <[players_final]> targets:<[players]>
      - narrate <[staff_final]> targets:<[staff]>
      ##TODO - Discord Messages
      #- wait 1t
      #- if <yaml[chat_config].read[channels.server.integrations.Discord.<bungee.server>.active]>:
