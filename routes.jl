using Genie.Router
using Genie.Renderer, Genie.Renderer.Html, Genie.Renderer.Json
using CSV

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

route("/players") do
  html(:players, :index, players=players)
end

route("/") do
  serve_static_file("welcome.html")
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