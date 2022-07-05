dummy_economy:
  type: economy
  priority: normal
  name single: dollar
  name plural: dollars
  digits: 2
  format: $<[amount]>
  balance: <player.flag[money]>
  has: <player.flag[money].is[or_more].than[<[amount]>]>
  withdraw:
    - flag <player> money:-:<[amount]>
  deposit:
    - flag <player> money:+:<[amount]>