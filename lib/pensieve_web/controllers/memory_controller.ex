defmodule PensieveWeb.MemoryController do
  use PensieveWeb, :controller

  alias Pensieve.Memories.Memory
  alias Pensieve.Memories

  def index(conn, _params) do
    memories = Memories.list_memories
    render(conn, :index, memories: memories)
  end

  def show(conn, %{"id" => id}) do
    memory = Memories.get_memory!(id)
    render(conn, :show, memory: memory)
  end

  def new(conn, _params) do
    changeset = Memories.change_memory(%Memory{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"memory" => memory_params}) do
    case Memories.create_memory(memory_params) do
      {:ok, memory} ->
        conn
        |> put_flash(:info, "Memory created successfully.")
        |> redirect(to: ~p"/memories/#{memory}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def edit(_conn, %{"id" => id} = _params) do
    memory = Memories.get_memory!(id)
    
  end
end
