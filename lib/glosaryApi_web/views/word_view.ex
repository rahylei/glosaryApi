defmodule GlosaryApiWeb.WordView do
  use GlosaryApiWeb, :view
  alias GlosaryApiWeb.WordView

  def render("index.json", %{words: words}) do
    %{data: render_many(words, WordView, "word.json")}
  end

  def render("show.json", %{word: word}) do
    %{data: render_one(word, WordView, "word.json")}
  end

  def render("word.json", %{word: word}) do
    %{
      id: word.id,
      name: word.name,
      description: word.description,
      #category: word.category
    }
  end
end
