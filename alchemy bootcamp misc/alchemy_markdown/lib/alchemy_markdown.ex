defmodule AlchemyMarkdown do
  def to_html(markdown) do
    Earmark.as_html!((markdown || ""), %Earmark.Options{smartypants: false})
      |> big
      |> small
      |> hrs
  end

  def small(markdown) do
    Regex.replace(~r/\-\-(.*)\-\-/, markdown, "<small>\\1</small>")
  end

  def big(markdown) do
    Regex.replace(~r/\+\+(.*)\+\+/, markdown, "<big>\\1</big>")
  end

  def hrs(text) do
    Regex.replace(~r{(^\r\n|\r|\n)([-*])( *\2 *)+\2}, text, "\\1<hr />")
  end

  def test_str do
    """
    # Main title of my doc

    ## A less important header

    I *really* disagree with u!
    You can **strongly** emphasize the text

    - - -
    ## Another section

    You can make lists of

    1. One
    2. Two
    3. Three

    things ++big things!++ --small things--
    *                 **
    """
  end
end
