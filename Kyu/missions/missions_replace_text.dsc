# -- MISSIONS REPLACE TEXT
# Replace text mapping
missions_replace_text:
  type: data
  items: -items-
  max: -max-

# Replace text in name
missions_replace_name:
  type: procedure
  debug: false
  definitions: name|map
  script:
    - narrate <[name]>
    - narrate <[map]>
    - stop if:<[name].exists.not>
    - stop if:<[map].exists.not>
    - foreach <[map]>:
      - define name <[name].replace[<script[missions_replace_text].data_key[<[key]>]>].with[<[value]>]>
    - determine <[name]>

# Replace text in description
missions_replace_description:
  type: procedure
  debug: true
  definitions: description|map
  script:
    - narrate <[description]>
    - narrate <[map]>
    - stop if:<[description].exists.not>
    - stop if:<[map].exists.not>
    - define description <[description].escaped>
    - foreach <[map]>:
      - define description <[description].replace[<script[missions_replace_text].data_key[<[key]>]>].with[<[value]>]>
    - determine <[description].unescaped>
