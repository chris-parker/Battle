require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    $game = Game.new(Player.new(params[:player_1]), Player.new(params[:player_2]))
    redirect '/play'
  end

  get '/play' do
    @player_1 = $game.players.first.name
    @player_2 = $game.players.last.name
    erb :play
  end

  get '/attack' do
    @player_1 = $game.players.first.name
    @player_2 = $game.players.last.name
    $game.attack
    erb :attack
  end

  post '/attack' do
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
