google_webget_result:
    type: task
    debug: false
    script:
        - ~webget https://google.com save:google
        - narrate <entry[google].result>

google_webget_failed:
    type: task
    script:
        - ~webget https://google.com save:google
        - narrate <entry[google].failed>

google_webget_rawBinary:
    type: task
    script:
        - ~webget https://google.com save:google
        - narrate <entry[google].result_binary>

google_webget_result_headers:
    type: task
    script:
        - ~webget https://google.com save:google
        - narrate <entry[google].result_headers>

google_webget_status:
    type: task
    script:
        - ~webget https://google.com save:google
        - narrate <entry[google].status>

google_webget_timeRan:
    type: task
    script:
        - ~webget https://google.com save:google
        - narrate <entry[google].time_ran>

