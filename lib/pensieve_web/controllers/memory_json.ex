defmodule PensieveWeb.MemoryJSON do
  alias Pensieve.Memories.Memory

  def index(%{memories: memories}) do
    %{data: for(memory <- memories, do: data(memory))}
  end 

  defp data(%Memory{} = memory) do
    %{
      id: memory.id,
      title: memory.title,
      content: memory.content
    }
  end
end
