require "sinatra"
require "sinatra/contrib/all"
require "pry-byebug"
require "json"
require_relative "models/game"

get '/' do
  erb(:home)
end


get '/game/:choice1/:choice2' do
  game = Game.new(params[:choice1], params[:choice2])
  @result = game.play()
  erb(:result)
end

get '/game/:choice1' do
  computer = ['rock','paper','scissors'].sample
  game = Game.new(params[:choice1], computer)
  @result = game.play()
  erb(:result)
end
