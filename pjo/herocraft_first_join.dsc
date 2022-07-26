first_join_test_script:
    type: task
    script:
    - foreach stone_sword|stone_pickaxe|stone_axe|stone_shovel|tpa_crystal|campfire|food_crate as:item:
        - give <[item]>
