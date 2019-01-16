
defmodule WordCounting do
	
	def count_words() do

		filename = IO.gets("File to count the words from: ") |> String.trim()
		words = File.read!(filename)
		|> String.split(~r{(\\n|[^\w'])+})
		|> Enum.filter(fn x -> x != "" end)

		words |> Enum.count |> IO.puts
	end

	def count_lines() do

		filename = IO.gets("File to count the lines from: ") |> String.trim()
		lines = File.read!(filename)
		|> String.split(~r{(\r\n|\n|\r)})

		lines |> Enum.count |> IO.puts
	end

	def count_chars() do
		filename = IO.gets("File to count the characters from: ") |> String.trim()
		characters = File.read!(filename)
		|> String.split(~r{|[^\w']+})
		|> Enum.filter(fn x -> x != "" end)

		characters |> Enum.count |> IO.puts
	end

	def what_to_count() do
		what_count = IO.gets("What would you like to count? Words (w), lines (l) or characters (c)? ")

		case String.trim(what_count) do
			value when value in ["words", "Words", "W", "w"] -> count_words()
			value when value in ["lines", "Lines", "L", "l"] -> count_lines()
			value when value in ["characters", "Characters", "C", "c"] -> count_chars()
			_ -> IO.puts "What do you mean? Words (w), lines (l) or characters (c) "
				what_to_count()
		end
	end
	
end