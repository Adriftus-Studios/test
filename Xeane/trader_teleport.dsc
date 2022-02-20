trader_teleport:
  type: task
  debug: false
  script:
    - flag player trader.last_location:<player.location>
    - repeat 40:
      - playeffect effect:enchantment_table quantity:30 data:<element[0.2].mul[<[value]>].add[1]> at:<player.location.above[<element[1].add[<[loop_index].mul[0.1]>]>]>
      - wait 2t
    - repeat 10:
      - playeffect effect:redstone quantity:30 special_data:5|purple offset:0.6 at:<player.location.above[0.8]>
      - playeffect effect:enchantment_table quantity:30 data:4 at:<player.location.above[3.8]>
      - wait 2t
    - teleport trader_homeworld

homeland:
  type: command
  name: homeland
  description: N/A
  usage: /homeland
  script:
    - if !<player.has_flag[trader.accepted]>:
      - narrate "<&c>You dare attempt this...?"
      - hurt 2 cause:suicide
      - stop
    - else if <player.location.world.name> == fourth_dimension:
      - narrate "You are already here..."
      - stop
    - run trader_teleport

trader_rebirth:
  type: task
  debug: false
  script:
    - title title:<&d>Welcome...
    - adjust <player> gravity:false
    - adjust <player> velocity:0,0.1,0
    - flag player trader.last_location:<player.location>
    - flag player no_damage
    - flag player no_fly_kick duration:10s
    - cast confusion duration:20s
    - adjust <player> freeze_duration:30s
    - repeat 80:
      - playeffect effect:enchantment_table quantity:30 data:<element[0.2].mul[<[value]>].add[1]> at:<player.location.above[3.8]>
      - wait 2t
    - title title:<&c>Nomad
    - repeat 20:
      - playeffect effect:redstone quantity:30 special_data:5|purple offset:0.6 at:<player.location.above[0.8]>
      - playeffect effect:enchantment_table quantity:30 data:4 at:<player.eye_location>
      - wait 4t
    - adjust <player> gravity:true
    - flag player trader.rebirth:<player.inventory.list_contents> duration:10s
    - flag player no_damage:!
    - hurt 1000

strange_kelp:
  type: item
  material: dried_kelp
  display name: <&a>Strange Kelp
  mechanisms:
    hides: ALL
    enchantments: luck,1
  flags:
    soulbound: true
  lore:
    - "<&7>A weird papery substance"
    - "<&7>It is dry and brittle to the touch"
    - "<&b>You have an odd urge to eat it..."
  recipes:
    1:
      type: shapeless
      input: kelp|glow_ink_sac|ender_eye|amethyst_shard|nether_wart|water_bucket|phantom_membrane|trader_invitation|glow_lichen

trader_invitation:
  type: book
  debug: false
  title: <&d>A Mysterious Invitation
  author: <&c>The Trademaster
  signed: true
  text:
    - "Greetings Traveller, You have been selected.<n><n> In this book you shall find a great journey, not for the meak.<n><n>Continue reading, or discard this book if you are not up for the task"
    - "<&a>Kelp<&r><n><n>The first ingredient you shall require is kelp.<n><n>Not the dry stuff, it needs to be alive!<n><n>This is one of many ingredient required"
    - "<&a>Glow Ink Sac<&r><n><n>You ever see those weird glowing squids underground?<n><n>No? Go look!<n>Yes? Good, kill them!<n><n>You will require 1 sac of ink from them"
    - "<&a>Amethyst Shard<&r><n><n>This one should be easy, go play with some dirt, until you find some purple stuff.<n><n>For the love of god, don't dig straight down..."
    - "<&a>Nether Wart<&r><n><n>Alright, you know that firey hell pit? Yep, we're sending you there.<n><n>You're gunna need this red stuff, looks like a wart. Who the hell comes up with this stuff?"
    - "<&a>Water Bucket<&r><n><n>Alright, here's an easy one. Make a bucket, fill it with water<n><n>No seriously, go do it."
    - "<&a>Phantom Membrane<&r><n><n>This one is tricky, you know those flying devils that attack you after you don't sleep?<n><n>...Yea, you need their brain.<n><n>Don't ask questions."
    - "<&a>Glow Lichen<&r><n><n>Last ingredient you'll need to hunt down is that glowy crap all over the underground<n><n>Glow Licin? Licken? I don't know..."
    - "<&a>Completion<&r><n><n>As the ninth, and final ingredient you will use this book... combine it with the rest of the crap!<n><n><&c>Good Luck...<n><&4>- The Trademaster"

trader_events:
  type: world
  debug: false
  events:
    on player consumes strange_kelp:
      - if <player.has_flag[trader.quest]>:
        - run trader_teleport
      - else:
        - hurt 100 cause:SUICIDE
    on player dies flagged:trader.rebirth:
      - determine passively NO_DROPS
      - determine NO_MESSAGE
    on player respawns flagged:trader.rebirth:
      - determine passively trader_homeworld
      - wait 1t
      - give <player.flag[trader.rebirth]> to:<player.inventory> if:<player.flag[trader.rebirth].size.is_more_than[0]>
      - flag player trader.rebirth:!
      - wait 1t
      - flag player trader.accepted
