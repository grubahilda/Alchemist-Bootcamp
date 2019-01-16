defmodule MiniMarkdown do
	def to_html(text) do
		# do lots of transforms in a pipeline
		text
			|> heading
			|> bold
		    |> italics
		    |> p
		    |> small
		    |> big
	end

	def heading(text) do
		Regex.replace(~r/(\#(.*))+((\r\n|\r|\n)+$)?/, text, "<h1>\\2</h1>")
	end

	def bold(text) do
		Regex.replace(~r/\*\*(.*)\*\*/, text, "<strong>\\1</strong>")
	end

	def italics(text) do
		Regex.replace(~r/\*(.*)\*/, text, "<em>\\1</em>")
	end

	def p(text) do
		Regex.replace(~r/(\r\n|\r|\n|^)+([^\r\n]+)((\r\n|\r|\n)+$)?/, text, "<p>\\2<p/>")

	end

	def small(text) do
		Regex.replace(~r/\-(.*)\-/, text, "<small>\\1</small>")
	end

	def big(text) do
		Regex.replace(~r/\+(.*)\+/, text, "<big>\\1</big>")
	end

	def test_str do
		"""
		#Announcment!
		I *so* enjoyed eating that burrito and the hot sauce was **amazing**!

		+What did you think of it?+
		-asdf-
		"""
	end
end