shitty_nimbus_flight:
  type: world
  debug: false
  events:
    on player right clicks block with:nimbus_69420_item:
      # if they're holding the nimbus, they may ride into the sunset
      - spawn nimbus_69420_entity <player.location.with_y[<player.location.y.add[200]>]> save:broom
      #- cast invisibility duration:24h hide_particles no_ambient no_icon <entry[broom].spawned_entity>
      - wait 1t
      - take iteminhand
      - teleport <entry[broom].spawned_entity> <player.location>
      - wait 3t
      - mount <player>|<entry[broom].spawned_entity>
      - flag player nimbus:<player.vehicle>

    # for when the player forgets to remove the nimbus from their crotch before leaving
    after player joins flagged:nimbus:
      - mount nimbus_69420_entity|<player>
      - flag player nimbus:<player.passenger>

    after player quits flagged:nimbus:
      - remove <player.flag[nimbus]>

    on player exits nimbus_69420_entity:
      - give nimbus_69420_item slot:<player.held_item_slot>
      - remove <player.flag[nimbus]>
      - flag player nimbus:!

    on player steers nimbus_69420_entity:
      - look <context.entity> <player.location.forward[10]>
      - ratelimit <player> 5t
      - define velocity <location[0,0,0]>
      - define velocity <[velocity].add[<player.location.direction.vector.normalize.mul[2]>]> if:<context.forward.is_more_than[0]>
      - define velocity <[velocity].with_y[0.5]> if:<context.jump>
      - adjust <player> velocity:<[velocity]> if:<[velocity].vector_length.is_more_than[0.1]>
      - narrate <[velocity]>
      - narrate <[velocity].vector_length.is_more_than[0.1]>

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
    age: baby|locked
    invulnerable: true
    potion_effects: INVISIBILITY,0,2147483646,false,false,false
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
