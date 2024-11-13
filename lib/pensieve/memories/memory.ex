defmodule Pensieve.Memories.Memory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "memories" do
    field :content, :string
    field :title, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(memory, attrs) do
    memory
    |> cast(attrs, [:title, :content])
    |> validate_required([:title])
    |> validate_length(:title, max: 100)
    |> validate_format(:content, ~r"^((?!voldemort).)*$", message: "contains the forbidden name")
  end
end
