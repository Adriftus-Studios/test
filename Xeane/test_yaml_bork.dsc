test_broken_yaml:
  type: task
  debug: false
  script:
    - yaml create id:test
    - yaml set id:test test:<&chr[1001]> test
    - yaml savefile:test.yml id:test
    - yaml unload id:test
    - yaml load:test.yml id:test
    - narrate <yaml[test].read[test]>