shitty_nimbus_flight:
  type: world
  debug: false
  events:
    after player toggles flying:
      # if they're holding the nimbus, they may ride into the sunset
      - if <context.state> && <player.item_in_hand.script.name.if_null[invalid]> == nimbus_69420_item:
        - mount <player>|nimbus_69420_entity
        - cast invisibility amplifier:1 duration:24h hide_particles no_ambient no_icon <player.vehicle>
        - flag player nimbus:<player.vehicle>
        - take iteminhand

      # if they're riding the nimbus, all perfect things must come to an end eventually
      # the nimbus must be respected, it will only remain with you if your best hand is free
      - else if <player.has_flag[nimbus]>:
        - define nimbus_entity <player.flag[nimbus]>

        # the nimbus will fly into the unobservable universe if it feels disrespected
        - if <player.item_in_hand.material.name> != air:
          - narrate "<&c>Oh no, your nimbus 69420 flew away..."
          - mount <[nimbus_entity]> cancel

          # farewell, you beautiful stallion
          - playsound ENTITY_FIREWORK_ROCKET_LAUNCH <player.location>
          - repeat 40:
            - playeffect effect:CLOUD at:<[nimbus_entity].location> quantity:2  offset:0.1
            - wait 1t
            - adjust <[nimbus_entity]> velocity:<location[0,2,0].with_pose[<player>].with_y[1].forward[2]>
          - playsound ENTITY_FIREWORK_ROCKET_LARGE_BLAST_FAR <[nimbus_entity].location> volume:10

        - else:
          # the nimbus is respected and will remain in your hand
          - give nimbus_69420_item slot:<player.held_item_slot>

        - remove <[nimbus_entity]>
        - flag player nimbus:!

    # for when the player forgets to remove the nimbus from their crotch before leaving
    after player joins flagged:nimbus:
      - mount nimbus_69420_entity|<player>
      - flag player nimbus:<player.passenger>

    after player quits flagged:nimbus:
      - remove <player.flag[nimbus]>

    on player steers nimbus_69420_entity:
      - ratelimit <player> 5t
      - adjust <player.vehicle> velocity:<player.location.direction.vector.normalize.mul[2]>
      - look <player.vehicle> <player.location.forward[10]>

nimbus_i_call_forth_thee:
  type: command
  name: give_me_the_nimbus
  description: Gives you the Nimbus 69420
  usage: /give_me_the_nimbus
  permission: best
  permission message: You can't obtain the Nimbus 69420 because you aren't the best!
  aliases:
  - gimmienimmie
  - nimbusget
  script:
    # you should know better >:(
    - if !<context.args.is_empty>:
      # A Quantity maybe? BAD!
      - if <context.args.first.is_integer>:
        - narrate "<&c>Don't be greedy, just take one <&gt>:("
        - stop
      - narrate "<&c>It's just <&6>/<&e>give_me_the_nimbus<&c>, there aren't any arguments"
      - stop

    # Respect the nimbus, it should go directly to your best hand!
    - if <player.item_in_hand.material.name> != air:
      - narrate "<&c>The nimbus 69420 demands your BEST hand be free."
      - stop

    # hey good lookin'
    - give nimbus_69420_item slot:<player.held_item_slot>
    - playsound <player> sound:ENTITY_PLAYER_LEVELUP volume:10

nimbus_69420_entity:
  type: entity
  debug: false
  entity_type: zombie
  mechanisms:
    gravity: false
    invulnerable: true
    equipment:
    - air
    - air
    - air
    - nimbus_69420_item

nimbus_69420_item:
  type: item
  debug: false
  material: stick
  display name: <&6><&k>lasa <&e>The Nimbus 69420 <&6><&k>gna!
  mechanisms:
    custom_model_data: 69420