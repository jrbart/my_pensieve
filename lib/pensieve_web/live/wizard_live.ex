defmodule PensieveWeb.WizardLive do
  use PensieveWeb, :live_view

  def mount(_params, _session, socket) do
    wizards = Pensieve.Hogwarts.list_wizards()
    {:ok, assign(socket, :wizards, wizards)}
  end

  def handle_event("search_wizard", %{"value" => name}, socket) do
    wizards = Pensieve.Hogwarts.search_by_name(name)
    {:noreply, assign(socket, :wizards, wizards)}
  end
end
