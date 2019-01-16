defmodule WordCount.CLI do
  def main(args) do
    {parsed, args, invalid} = OptionParser.parse(
      args,
      switches: [chars: nil, lines: nil, words: nil],
      aliases: [c: :chars, w: :words, l: :lines])

    WordCount.start(parsed, args, invalid)
  end

end
