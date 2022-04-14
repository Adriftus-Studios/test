tag_parser:
    type: command
    name: Parse
    debug: false
    description: Parses a tag.
    usage: /parse <&lt>announce/narrate<&gt> tag
    aliases:
        - tag
    tab completions:
        1: announce|narrate
        2: <&lt>tag<&gt>
    script:
        - if <context.args.get[1].equals[announce]>:
            - announce <context.args.get[2].parse[tag]>
        - else if <context.args.get[1].equals[narrate]>:
            - narrate <context.args.get[2].parse[tag]>
# narrate <element[<&lt>tag<&gt>].parse[tag]>