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

    http = require 'http'
    qs = require 'querystring'
    AUTH_TOKEN = 'a8bf7a1006276ecdd7db8e6287336d'

    robot.router.get "/beta_invites", (req, res) ->
      res.end "POST a Mailchimp event to this URL"

    robot.router.post "/beta_invites", (req, res) ->
      body = qs.stringify({
        room_id: 'BandFrame',
        message: "If you ship it, they will come: #{req.body.data.email} just subscribed to the launch list.",
        from: "Dude Bot"
      })
      options = {
        host: 'api.hipchat.com',
        port: 80,
        path: "/v1/rooms/message?notify=true&color=gray&auth_token=#{AUTH_TOKEN}",
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Content-Length': body.length
        }
      }
      post = http.request options, (res) ->
        res.on 'data', (chunk) ->
          console.log('received from mailchimp: ' + chunk)
      post.write body
      post.end
      res.end ''
