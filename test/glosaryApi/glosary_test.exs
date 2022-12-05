defmodule GlosaryApi.GlosaryTest do
  use GlosaryApi.DataCase

  alias GlosaryApi.Glosary

  describe "words" do
    alias GlosaryApi.Glosary.Word

    import GlosaryApi.GlosaryFixtures

    @invalid_attrs %{category: nil, description: nil, name: nil}

    test "list_words/0 returns all words" do
      word = word_fixture()
      assert Glosary.list_words() == [word]
    end

    test "get_word!/1 returns the word with given id" do
      word = word_fixture()
      assert Glosary.get_word!(word.id) == word
    end

    test "create_word/1 with valid data creates a word" do
      valid_attrs = %{category: 42, description: "some description", name: "some name"}

      assert {:ok, %Word{} = word} = Glosary.create_word(valid_attrs)
      assert word.category == 42
      assert word.description == "some description"
      assert word.name == "some name"
    end

    test "create_word/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Glosary.create_word(@invalid_attrs)
    end

    test "update_word/2 with valid data updates the word" do
      word = word_fixture()
      update_attrs = %{category: 43, description: "some updated description", name: "some updated name"}

      assert {:ok, %Word{} = word} = Glosary.update_word(word, update_attrs)
      assert word.category == 43
      assert word.description == "some updated description"
      assert word.name == "some updated name"
    end

    test "update_word/2 with invalid data returns error changeset" do
      word = word_fixture()
      assert {:error, %Ecto.Changeset{}} = Glosary.update_word(word, @invalid_attrs)
      assert word == Glosary.get_word!(word.id)
    end

    test "delete_word/1 deletes the word" do
      word = word_fixture()
      assert {:ok, %Word{}} = Glosary.delete_word(word)
      assert_raise Ecto.NoResultsError, fn -> Glosary.get_word!(word.id) end
    end

    test "change_word/1 returns a word changeset" do
      word = word_fixture()
      assert %Ecto.Changeset{} = Glosary.change_word(word)
    end
  end
end
