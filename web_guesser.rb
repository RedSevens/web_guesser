require 'sinatra'
require 'sinatra/reloader'

secret_number = rand(100) + 1

get '/' do
	"The secret number is #{secret_number}"
end