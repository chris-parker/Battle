require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1])
    player_2 = Player.new(params[:player_2])
    @game = Game.create(player_1, player_2)
    redirect '/play'
  end

  before do
    @game = Game.instance
  end

  get '/play' do
    redirect '/p1dead' if @game.players.first.dead?
    redirect '/p2dead' if @game.players.last.dead?
    @player_1 = @game.players.first.name
    @player_2 = @game.players.last.name
    erb :play
  end

  get '/attack' do
    @player_1 = @game.players.first.name
    @player_2 = @game.players.last.name
    @game.attack
    erb :attack
  end

  post '/attack' do
    redirect '/play'
  end

  get '/p1dead' do
    erb :p1dead
  end

  get '/p2dead' do
    erb :p2dead
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
