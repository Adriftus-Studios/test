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
    - stop if:<[name].exists.not>
    - stop if:<[map].exists.not>
    - foreach <[map]>:
      - define name <[name].replace[<script[missions_replace_text].data_key[<[key]>]>].with[<[value]>]>
    - determine <[name]>

# Replace text in description
missions_replace_description:
  type: procedure
  debug: false
  definitions: description|map
  script:
    - stop if:<[description].exists.not>
    - stop if:<[map].exists.not>
    - foreach <[description]>:
      - define index <[loop_index]>
      - foreach <[map]>:
        - define description[<[index]>] <[name].replace[<script[missions_replace_text].data_key[<[key]>]>].with[<[value]>]>
    - determine <[description]>
