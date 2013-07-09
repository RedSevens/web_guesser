require 'sinatra'
require 'sinatra/reloader'

#Creates a random number from 1-99
number = rand(99) + 1

get '/' do
	erb :index, :locals => {:number => number}
end