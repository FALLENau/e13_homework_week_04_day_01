require "sinatra"
require "sinatra/contrib/all"
require "pry-byebug"
require "json"
require_relative "models/calculator"


get '/add/:number1/:number2' do
  calculator = Calculator.new(params["number1"].to_i, params["number2"].to_i)
  return "#{calculator.add()}"
end

get '/subtract/:number1/:number2' do
  calculator = Calculator.new(params["number1"].to_i, params["number2"].to_i)
  return "#{calculator.subtract()}"
end

get '/multiply/:number1/:number2' do
  calculator = Calculator.new(params["number1"].to_i, params["number2"].to_i)
  return "#{calculator.multiply()}"
end

get '/divide/:number1/:number2' do
  calculator = Calculator.new(params["number1"].to_f, params["number2"].to_f)
  return "#{calculator.divide()}"
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
