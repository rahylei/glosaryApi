defmodule GlosaryApi.Glosary.Word do
  use Ecto.Schema
  import Ecto.Changeset

  schema "words" do
    #field :category, :integer
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(word, attrs) do
    word
    |> cast(attrs, [
      :name,
      :description,
      #:category
      ])
    |> validate_required([
      :name,
      :description,
      #:category
      ])
    |> unique_constraint(:name)
  end
end
