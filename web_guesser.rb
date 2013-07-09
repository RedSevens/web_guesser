require 'sinatra'
require 'sinatra/reloader'

#Creates a random number from 1-99
NUMBER = (rand(99) + 1).to_s

get '/' do
	your_guess = params['guess']
	message = check(your_guess)
	erb :index, :locals => {:number => $number, :message => message, :answer => @answer}
end

def check(guess)
	number = NUMBER
	if guess == nil
		return nil
	elsif guess.to_i - number.to_i > 5
		return "Way too high"
	elsif guess.to_i > number.to_i
		return "Too high"
	elsif number.to_i - guess.to_i > 5
		return "Way too low"
	elsif guess.to_i < number.to_i
		return "Too low"
	else
		@answer = true
		return "You got it right!"
	end
end