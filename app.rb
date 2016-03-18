require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base

  get '/' do
    erb(:index)
  end

  before do
    @game = Game
  end

  post '/names' do
    @player_1 = Player.new(params[:player_1])
    @player_2 = Player.new(params[:player_2])
    Game.start(@player_1, @player_2)
    redirect '/play'
  end

  get '/play' do
    redirect '/victory' if @game.game_over?
    erb(:home)
  end

  get '/attack' do
    @game.attack
    erb(:attack)
  end

  get '/victory' do
    erb(:victory)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
