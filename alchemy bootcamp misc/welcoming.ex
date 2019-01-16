defmodule WelcomeUser do
	answer = IO.gets "Hi there! What's your name?\n"
	case String.trim(answer) do
		"Marta" -> "Wow, Marta is my favourite name! I was programmed by a Marta!\n"
		_ ->
			new_answer = String.trim(answer)
			IO.puts "Welcome, #{new_answer}! Nice to meet you. Have a good day :)"
	end
end