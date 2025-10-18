defmodule HoopsProfileWeb.DashboardLive.ShowGame do
  @moduledoc """
  Show a hosted game
  """
  use HoopsProfileWeb, :live_view

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-7xl px-4 mt-3">
      <div>
        <.back navigate={~p"/dashboard/games"} class="mr-2">Back</.back>
      </div>

      <.header>
        <div class="flex flex-row justify-between items-center mt-5">
          {@game.title}
          <.button phx-click="edit-game">Edit Game</.button>
        </div>
        <:subtitle>
          Details for the hosted game.
        </:subtitle>
      </.header>

      <div class="bg-white shadow overflow-hidden sm:rounded-lg">
        <div class="border-t border-gray-200">
          <dl>
            <div class="bg-gray-500 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
              <dt class="text-sm font-medium text-white">Title</dt>
              <dd class="mt-1 text-sm font-bold text-white sm:mt-0 sm:col-span-2">{@game.title}</dd>
            </div>
          </dl>
          <dl>
            <div class="bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
              <dt class="text-sm font-medium text-gray-500">Date & Time</dt>
              <dd class="mt-1 text-sm font-bold text-gray-500 sm:mt-0 sm:col-span-2">{@game.time}</dd>
            </div>
            <div class="bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
              <dt class="text-sm font-medium text-gray-500">Location</dt>
              <dd class="mt-1 text-sm font-bold text-gray-500 sm:mt-0 sm:col-span-2">
                {@game.location}
              </dd>
            </div>
            <div class="bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
              <dt class="text-sm font-medium text-gray-500">Players</dt>
              <ul class="mt-1 text-sm text-gray-500 sm:mt-0 sm:col-span-2">
                <li class="font-semibold">Number of Players: {@game.num_players}</li>
                <li class="font-semibold mt-2">Player List:</li>
                <li class="mt-1">
                  <.table id="players" rows={@game.players}>
                    <:col :let={player} label="Name">
                      {player.name}
                    </:col>
                    <:col :let={player} label="Position">
                      {player.position}
                    </:col>
                    <:action :let={player}>
                      <.link
                        navigate={~p"/players/#{player.id}"}
                        class="text-indigo-600 hover:text-indigo-900"
                      >
                        View
                      </.link>
                      <.link
                        navigate={~p"/players/#{player.id}"}
                        class="text-red-600 hover:text-red-900 ml-4"
                      >
                        Remove
                      </.link>
                    </:action>
                  </.table>
                </li>
              </ul>
            </div>
          </dl>
        </div>
      </div>
    </div>
    """
  end

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       page_title: "Game Details",
       game: %{
         id: 1,
         title: "Sunday Pickup Game",
         time: "January 1, 2025 10:00 AM",
         location: "La Consolacion Basketball Court, Marikina City, Philippines",
         num_players: 10,
         players: list_players(),
         status: "Open"
       }
     )}
  end

  defp list_players do
    [
      %{id: 1, name: "Alice", position: "Guard"},
      %{id: 2, name: "Bob", position: "Forward"},
      %{id: 3, name: "Charlie", position: "Center"},
      %{id: 4, name: "Diana", position: "Guard"},
      %{id: 5, name: "Ethan", position: "Forward"},
      %{id: 6, name: "Fiona", position: "Center"},
      %{id: 7, name: "George", position: "Guard"},
      %{id: 8, name: "Hannah", position: "Forward"},
      %{id: 9, name: "Ian", position: "Center"},
      %{id: 10, name: "Jane", position: "Guard"}
    ]
  end
end
