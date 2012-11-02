# Description:
#   Receive hooks from mailchimp
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# URLS:
#   /hubot/version
#   /hubot/ping
#   /hubot/time
#   /hubot/info


module.exports = (robot) ->
    robot.router.get "/beta_invites", (req, res) ->
      res.end "POST a Mailchimp event to this URL"

    robot.router.post "/beta_invites", (req, res) ->
      res.end ''
      robot.send {room: '27319_bandframe@conf.hipchat.com'}, 'BandFrame', "EVENT FROM MAILCHIMP: #{req.body}"
  # robot.router.get "/hubot/version", (req, res) ->
  #   res.end robot.version
  #
  # robot.router.post "/hubot/ping", (req, res) ->
  #   res.end "PONG"
  #
  # robot.router.get "/hubot/time", (req, res) ->
  #   res.end "Server time is: #{new Date()}"
  #
  # robot.router.get "/hubot/info", (req, res) ->
  #   child = spawn('/bin/sh', ['-c', "echo I\\'m $LOGNAME@$(hostname):$(pwd) \\($(git rev-parse HEAD)\\)"])
  #
  #   child.stdout.on 'data', (data) ->
  #     res.end "#{data.toString().trim()} running node #{process.version} [pid: #{process.pid}]"
  #     child.stdin.end()
