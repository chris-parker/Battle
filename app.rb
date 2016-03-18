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
    Game.start(@player_1, @player_2)
    redirect '/play'
  end

  get '/play' do
    @game = Game
    redirect '/victory' if @game.player_2.dead?
    erb(:home)
  end

  get '/attack' do
    @game = Game
    @game.attack
    erb(:attack)
  end

  get '/victory' do
    @game = Game
    erb(:victory)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
