require 'sinatra'
require 'sinatra/contrib/all' if development?


get '/hi' do
 "whoooohooo!"
end

get '/die' do
  rand(1..6).to_s
end

get '/name/:first/:last' do
  return "Your name is #{params[:first]} #{params[:last]}"
end

get '/friends/:number' do
  friends = ["Joey", "Phoebe", "Chandler", "Monica", "Rachel", "Ross"]
  index = params["number"].to_i - 1
  return friends[index]
end #Note: "number" can also be :number as long as its converted to integer.to_i


get "/pet/:hello" do
  "Hello pet"
end

get "/pet_name/:name" do
  "hello punk #{params[:name]}"
end
