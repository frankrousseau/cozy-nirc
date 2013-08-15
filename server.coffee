#
#  Dependencies
#
express = require("express")
ejs = require("ejs")
http = require("http")

#
#  Initialize & Configure Express
#
app = express()
app.configure ->
  app.engine "html", ejs.renderFile
  app.set "view engine", "html"
  app.set "views", __dirname + "/views"
  app.use express.static(__dirname + "/public")
  app.get "/", (req, res) ->
    res.render "index"

#
#  Initialize the Server
#
port = process.env.PORT || 3000
server = http.createServer(app).listen(port)

#
#  Load Main (Loads Socket.io & IRC)
#
require("./lib/main.js") server
console.log 'Nirc listening on port 3000...'
