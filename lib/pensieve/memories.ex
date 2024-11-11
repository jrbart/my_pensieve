defmodule Pensieve.Memories do
  alias Swoosh.Adapters.Local.Storage.Memory
  alias Pensieve.Repo
  alias Pensieve.Memories.Memory

  def list_memories, do: Repo.all(Memory)
    
  def get_memory!(id), do: Repo.get!(Memory, id)
end
