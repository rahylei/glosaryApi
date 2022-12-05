defmodule GlosaryApi.GlosaryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GlosaryApi.Glosary` context.
  """

  @doc """
  Generate a word.
  """
  def word_fixture(attrs \\ %{}) do
    {:ok, word} =
      attrs
      |> Enum.into(%{
        category: 42,
        description: "some description",
        name: "some name"
      })
      |> GlosaryApi.Glosary.create_word()

    word
  end
end
