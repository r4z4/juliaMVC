using Genie.Router
using Genie.Renderer, Genie.Renderer.Html, Genie.Renderer.Json, Genie.Requests
using CSV
using JuliaMVC.Teams

form = """
<form action="/" method="POST" enctype="multipart/form-data">
  <input type="text" name="team_name" value="" placeholder="What's the team name?" />
  <input type="text" name="coach" value="" placeholder="Who is the coach?" />
  <input type="text" name="location" value="" placeholder="What is the team's location?" />

  <input type="submit" value="Submit" />
</form>

<button><a href="/">Home</a></button>
"""

struct Value
  total::Float64
  offensive::Float64
  defensive::Float64
end
struct Player
    name::String
    minutes_played::Int
    value_per_minute::Value
end

players = [
  Player(player.player_name, player.minutes_played, 
         Value(
           player.vaep_rating,
           player.offensive_rating,
           player.defensive_rating))
  for player in CSV.File("data/player_stats.csv")
]

route("/", method = POST) do
  t = Team(team_name=postpayload(:team_name, "Placeholder"), coach=postpayload(:coach, "Placeholder"), location=postpayload(:location, "Placeholder"))
  save(t)
  "Team titled $(t.team_name) created successfully!"
end

route("/") do
  serve_static_file("welcome.html")
end

route("/add_team") do
  html(form)
end

route("/players") do
  html(:players, :index, players=players)
end

route("/hello.html") do
  html("Render plain HTML with html fn")
end

route("/hello.json") do
  json("Render JSON content with json fn")
end

route("/hello.txt") do
   respond("Redner txt content with respond fn", :text)
end