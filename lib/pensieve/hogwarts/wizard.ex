defmodule Pensieve.Hogwarts.Wizard do
  use Ecto.Schema
  import Ecto.Changeset

  schema "wizards" do
    field :first_name, :string
    field :house, :string
    field :last_name, :string
    field :points, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(wizard, attrs) do
    wizard
    |> cast(attrs, [:last_name, :first_name, :house, :points])
    |> validate_required([:last_name, :first_name, :house, :points])
  end
end
