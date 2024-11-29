defmodule PensieveWeb.API.MemoryController do
  use PensieveWeb, :controller

  alias Pensieve.Memories.Memory
  alias Pensieve.Memories

  action_fallback PensieveWeb.API.FallbackController

  def index(conn, _params) do
    memories = Memories.list_memories
    render(conn, :index, memories: memories)
  end

  def show(conn, %{"id" => id}) do
    with {:ok, memory} <- Memories.fetch_memory(id) do
      render(conn, :show, memory: memory)
    end
  end

  def create(conn, %{"memory" => memory_params}) do
    with {:ok, memory} <- Memories.create_memory(memory_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location",~p"/api/memories/#{memory}")
      |> render(:show, memory: memory)
    end
  end

  def update(conn, %{"id" => id, "memory" => memory_params} = params) do
    with {:ok, memory} <- Memories.fetch_memory(id),
      {:ok, memory} <- Memories.update_memory(memory, memory_params) do
        render(conn, :show, memory: memory)
      end
  end

  def delete(conn, %{"id" => id} = _params) do
    with {:ok, memory} <- Memories.fetch_memory(id) do
      {:ok, _memory} = Memories.delete_memory(memory)
      send_resp(conn, :no_content, "") 
    end  
  end
end
