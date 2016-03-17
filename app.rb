require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base

  get '/' do
    erb(:index)
  end

  post '/names' do
    @player_1 = Player.new(params[:player_1])
    @player_2 = Player.new(params[:player_2])
    $game = Game.new(@player_1, @player_2)
    redirect '/play'
  end

  get '/play' do
    @p1_name = $game.players.first.name
    @p2_name = $game.players.last.name
    erb(:greet_player)
  end

  get '/attack' do
    @p1_name = $game.players.first.name
    @p2_name = $game.players.last.name
    $game.attack($game.players.last)
    erb(:attack)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
