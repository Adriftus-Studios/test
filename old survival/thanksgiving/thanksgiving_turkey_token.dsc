thanksgiving_turkey_token:
  type: item
  material: cooked_chicken
  display name: <&6>Escaped Turkey!
  lore:
  - <&e>Return to the ATC post for a reward!
  mechanisms:
    custom_model_data: 1

turkey_eating_block_event:
  debug: false
  type: world
  events:
    on player clicks block with:thanksgiving_turkey_token:
      - determine passively cancelled
    on player clicks entity with:thanksgiving_turkey_token:
      - determine passively cancelled

