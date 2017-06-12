require "sinatra"
require "sinatra/contrib/all"
require "pry-byebug"
require "json"
require_relative "models/calculator"


get '/' do
  erb(:home)
end

get '/about_us' do
  erb(:about_us)
end

get '/add/:number1/:number2' do
  calculator = Calculator.new(params["number1"].to_i, params["number2"].to_i)
  @calculation = calculator.add()
  erb(:result)#note: erb takes in syimble and looks for a erb file by the name of result.
end #note: erb in rb file expexts :syimboles.

get '/subtract/:number1/:number2' do
  calculator = Calculator.new(params["number1"].to_i, params["number2"].to_i)
  @calculation = calculator.subtract()
  erb(:result)
end

get '/multiply/:number1/:number2' do
  calculator = Calculator.new(params["number1"].to_i, params["number2"].to_i)
  @calculation = calculator.multiply()
  erb(:result)
end

get '/divide/:number1/:number2' do
  calculator = Calculator.new(params["number1"].to_f, params["number2"].to_f)
  @calculation = calculator.divide()
  erb(:result)
end



get '/all/:number1/:number2' do
  content_type(:json)

  calculator = Calculator.new(params["number1"].to_f, params["number2"].to_f)

  results = {
    add: calculator.add(),
    subtract: calculator.subtract(),
    multiply: calculator.multiply(),
    divide: calculator.divide()
  }

  return results.to_json()
end
