defmodule PensieveWeb.MemoryHTML do
  use PensieveWeb, :html

  embed_templates "/memory_html/*"

  attr :memories, :list, required: true
  def information(assigns) do
    ~H"""
    <div class="italic mb-4">
      There are <%= length(@memories)%> memories in your Pensieve
    </div>
    """
  end
end
