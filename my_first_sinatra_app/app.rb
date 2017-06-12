require 'sinatra'
require 'sinatra/contrib/all' if development?


get '/hi' do
 "whoooohooo!"
end

get '/die' do
  rand(1..6).to_s
end
