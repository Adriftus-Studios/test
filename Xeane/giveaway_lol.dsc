giveaway_script:
  type: task
  debug: true
  data:
    block_list:
      - diamond_block
      - emerald_block
      - iron_block
      - lapis_block
      - gold_block
    amount: 40
  script:
    - define targets <player.location.forward_flat[10].find.surface_blocks.within[9]>
    - define origin <player.cursor_on.with_pose[<player>].backward>
    - repeat <script.data_key[data.amount]>:
      - shoot falling_block[fallingblock_type=<script.data_key[data.block_list].random>;fallingblock_drop_item=false] height:3 destination:<[targets].random> origin:<[origin]> save:fool
      - flag <entry[fool].shot_entity> showfake
      - flag <entry[fool].shot_entity> showfake_duration:10s
      - wait 5t