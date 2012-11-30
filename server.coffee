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
server = http.createServer(app).listen(process.env.PORT or 3000)

#
#  Load Main (Loads Socket.io & IRC)
#
require("./lib/main.js") server
