first_join_test_script:
    type: task
    script:
    - equip head:leather_helmet chest:leather_chestplate legs:leather_leggings feet:leather_boots
    - foreach stone_sword|stone_pickaxe|stone_axe|stone_shovel|tpa_crystal|campfire|food_crate as:item:
        - give <[item]>
