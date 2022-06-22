trade_inventory:
  type: inventory
  debug: false
  inventory: chest
  title: <&a>Trading!
  size: 54
  gui: true
  data:
    item_slots:
      player_1_head: 1
      player_2_head: 9
      player_1_confirm: 46
      player_2_confirm: 54
    click_script_slots:
      # Player 1 Trade Slots
      #1: trade_player_1_slot
      2: trade_player_1_slot
      3: trade_player_1_slot
      4: trade_player_1_slot
      10: trade_player_1_slot
      11: trade_player_1_slot
      12: trade_player_1_slot
      13: trade_player_1_slot
      19: trade_player_1_slot
      20: trade_player_1_slot
      21: trade_player_1_slot
      22: trade_player_1_slot
      28: trade_player_1_slot
      29: trade_player_1_slot
      30: trade_player_1_slot
      31: trade_player_1_slot
      37: trade_player_1_slot
      38: trade_player_1_slot
      39: trade_player_1_slot
      40: trade_player_1_slot
      #46: trade_player_1_slot
      47: trade_player_1_slot
      48: trade_player_1_slot
      49: trade_player_1_slot
      # Player 2 Trade Slots
      6: trade_player_2_slot
      7: trade_player_2_slot
      8: trade_player_2_slot
      #9: trade_player_2_slot
      15: trade_player_2_slot
      16: trade_player_2_slot
      17: trade_player_2_slot
      18: trade_player_2_slot
      24: trade_player_2_slot
      25: trade_player_2_slot
      26: trade_player_2_slot
      27: trade_player_2_slot
      33: trade_player_2_slot
      34: trade_player_2_slot
      35: trade_player_2_slot
      36: trade_player_2_slot
      42: trade_player_2_slot
      43: trade_player_2_slot
      44: trade_player_2_slot
      45: trade_player_2_slot
      51: trade_player_2_slot
      52: trade_player_2_slot
      53: trade_player_2_slot
      #54: trade_player_2_slot
    on_close: trade_inventory_cancel

trade_confirm_button:
  type: item
  debug: false
  material: paper
  display name: <&a>Confirm Trade
  lore:
    - "<&a>Accept the trade"
  mechanisms:
    custom_model_data: 3

trade_cancel_confirm_button:
  type: item
  debug: false
  material: barrier
  display name: <&a>Cancel Confirm
  lore:
    - "<&a>Cancel the confirmation"
    - "<&e>Allows further changes"

trade_open:
  type: task
  debug: false
  definitions: target
  script:
    - note <inventory[trade_inventory]> as:trade_<player.uuid>/<[target].uuid>
    - define inv_script <inventory[trade_inventory]>
    - inventory set slot:<[inv_script].data_key[data.item_slots.player_1_head]> o:player_head[skull_skin=<player.skull_skin>;display=<&a><player.name>;custom_model_data=100;flag=uuid:<player.uuid>] d:trade_<player.uuid>_<[target].uuid>
    - inventory set slot:<[inv_script].data_key[data.item_slots.player_2_head]> o:player_head[skull_skin=<[target].skull_skin>;display=<&a><[target].name>;custom_model_data=101;flag=uuid:<[target].uuid>] d:trade_<player.uuid>_<[target].uuid>
    - inventory set slot:<[inv_script].data_key[data.item_slots.player_1_confirm]> o:trade_confirm_button[flag=player:1] d:trade_<player.uuid>_<[target].uuid>
    - inventory set slot:<[inv_script].data_key[data.item_slots.player_2_confirm]> o:trade_confirm_button[flag=player:2] d:trade_<player.uuid>_<[target].uuid>
    - inventory open d:trade_<player.uuid>_<[target].uuid>
    - inventory open d:trade_<player.uuid>_<[target].uuid> player:<[target]>

trade_player_1_slot:
  type: task
  debug: false
  script:
    - narrate <context.inventory>

trade_player_2_slot:
  type: task
  debug: false
  script:
    - narrate <context.inventory>

trade_inventory_cancel:
  type: task
  debug: false
  script:
    - define player.1 <context.inventory.slot[<context.inventory.script.data_key[data.item_slots.player_1_head]>].flag[uuid]>
    - define player.2 <context.inventory.slot[<context.inventory.script.data_key[data.item_slots.player_2_head]>].flag[uuid]>
    - inventory close player:<[player.1]>
    - inventory close player:<[player.2]>
    - define inv_script <context.inventory.script>
    - foreach <context.inventory.map_slots> key:slot as:item:
      - if <[inv_script].data_key[data.click_script_slots.<[slot]>].exists>:
        - define number <[inv_script].data_key[data.click_script_slots.<[slot]>].substring[14,14]>
        - define target <[player.<[number]>]>
        - give <[item]> to:<player[<[player.<[number]>]>].inventory>
    - note remove as:<context.inventory.note_name>