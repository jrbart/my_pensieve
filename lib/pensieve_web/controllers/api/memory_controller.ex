defmodule PensieveWeb.API.MemoryController do
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

  def create(conn, %{"memory" => memory_params}) do
    {:ok, memory} = Memories.create_memory(memory_params)

    conn
    |> put_status(:created)
    |> put_resp_header("location",~p"/api/memories/#{memory}")
    |> render(:show, memory: memory)
  end

  def update(conn, %{"id" => id, "memory" => memory_params} = params) do
    memory = Memories.get_memory!(id)
    case Memories.update_memory(memory, memory_params) do
      {:ok, memory} -> 
        render(conn, :show, memory: memory)
      _ -> :error
    end
  end

  def delete(conn, %{"id" => id} = _params) do
    memory = Memories.get_memory!(id)
    {:ok, _memory} = Memories.delete_memory(memory)
    send_resp(conn, :no_content, "") 
  end
end
