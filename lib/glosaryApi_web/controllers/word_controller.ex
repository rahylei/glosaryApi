defmodule GlosaryApiWeb.WordController do
  use GlosaryApiWeb, :controller

  alias GlosaryApi.Glosary
  alias GlosaryApi.Glosary.Word

  action_fallback GlosaryApiWeb.FallbackController

  def index(conn, _params) do
    words = Glosary.list_words()
    render(conn, "index.json", words: words)
  end

  def create(conn, word_params) do#%{"word" => word_params}
    with {:ok, %Word{} = word} <- Glosary.create_word(word_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.word_path(conn, :show, word))
      |> render("show.json", word: word)
    end
  end

  def show(conn, %{"id" => id}) do
    word = Glosary.get_word!(id)
    render(conn, "show.json", word: word)
  end

  def update(conn, word_params) do #%{"id" => id, "word" => word_params}
    #word = Glosary.get_word!(id)
    word = Glosary.get_word!(conn.path_params["id"])
    with {:ok, %Word{} = word} <- Glosary.update_word(word, word_params) do
      render(conn, "show.json", word: word)
    end
  end

  def delete(conn, %{"id" => id}) do
    word = Glosary.get_word!(id)

    with {:ok, %Word{}} <- Glosary.delete_word(word) do
      send_resp(conn, :no_content, "")
    end
  end
end
