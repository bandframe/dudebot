# Description:
#   Keep the dude's thinking from getting too uptight.
#
# Commands:
#   hubot botbeer - Give the dude a beer
#   hubot botbowl - Give the dude a bowl
module.exports = (robot) ->
  BEERS = [
    "It's miller time. *bbbbbbrrrrarrrrrap*",
    "cheers!",
    "bandframe brewskies! *glug, glug, glug*"
  ]
  BOWLS = [
    "*gguuuuuuuuup* *aaaaaaaaahhhhhhhh*......... word y'all.",
    "spark it up then!"
  ]

  random = (list) -> "(dudebotcrunked) " + list[Math.floor(Math.random() * list.length)]

  robot.respond /(botbowl)/i, (msg) ->
    msg.send random(BOWLS)

  robot.respond /botbeer/i, (msg) ->
    msg.send random(BEERS)

