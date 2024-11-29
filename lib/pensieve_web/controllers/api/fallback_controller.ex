defmodule PensieveWeb.API.FallbackController do
  use PensieveWeb, :controller

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> json(%{errors: :not_found})
  end

  def call(conn, {:error, %Ecto.Changeset{}=changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> json(%{errors: Ecto.Changeset.traverse_errors(changeset, &format_error/1)})
  end

  def format_error({msg, opts}=arg) do
    IO.inspect(arg)
    Regex.replace(~r"%{(\w+)}", msg, fn _, key ->
      opts
      |> Keyword.get(
          String.to_existing_atom(key),
          key)
      |> to_string()
    end)
  end

end
