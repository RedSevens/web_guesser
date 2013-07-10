require 'sinatra'
require 'sinatra/reloader'

$number = (rand(99) + 1).to_s
$chances = 9
$previous_guess = 0

get '/' do
	if $chances > 0 && $previous_guess != params['guess'] && $answer == false
		$chances -= 1
	elsif $chances < 1 || $answer == true
		$answer = true
		$chances = 8
		$number = (rand(99) + 1).to_s
	end
	your_guess = params['guess']
	message = check(your_guess)
	$previous_guess = your_guess
	erb :index, :locals => {:number => $number, :message => message, :answer => $answer, :chances => $chances}
end

def check(guess)
	number = $number
	$answer = false
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
		$answer = true
		$chances = 8
		return "You got it right!"
	end
end