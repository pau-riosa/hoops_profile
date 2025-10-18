defmodule HoopsProfileWeb.DashboardLive.Games do
  @moduledoc """
  Host  games
  """
  use HoopsProfileWeb, :live_view

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-7xl px-4 mt-3">
      <div>
        <.back navigate={~p"/dashboard"} class="mr-2">Back</.back>
      </div>
      <div class="mt-5" />
      <.header>
        <div class="flex flex-row justify-between items-center mt-5">
          Games
          <.button phx-click="create-game">Host a Game</.button>
        </div>
        <:subtitle>
          Manage your hosted games below.
        </:subtitle>
      </.header>
      <.table id="games" rows={@games}>
        <:col :let={game} label="Status">
          <div class="flex items-center space-x-2">
            <div class={
              case game.status do
                "Scheduled" ->
                  "rounded-full border border-green-2 bg-green-500 w-3 h-3 text-green-600 font-bold mr-2"

                "Completed" ->
                  "rounded-full border border-blue-2 bg-blue-500 w-3 h-3 text-blue-600 font-bold mr-2"

                "Cancelled" ->
                  "rounded-full border border-red-2 bg-red-500 w-3 h-3 text-red-600 font-bold mr-2"

                _ ->
                  "text-gray-600 font-bold"
              end
            }>
            </div>
            {game.status}
          </div>
        </:col>
        <:col :let={game} label="Name">
          {game.title}
        </:col>
        <:col :let={game} label="Date and Time">
          {game.time}
        </:col>
        <:col :let={game} label="Players">
          {game.num_players}
        </:col>

        <:col :let={game} label="Type">
          <span class="px-4 py-1 text-gray-600 font-bold">
            {game.type}
          </span>
        </:col>
        <:col :let={game} label="Location">
          {game.location}
        </:col>
        <:action :let={game}>
          <.link
            navigate={~p"/dashboard/games/#{game.id}"}
            class="text-indigo-600 hover:text-indigo-900 mr-4"
          >
            View
          </.link>
          <.link phx-click="edit" phx-value-id={game.id} class="text-indigo-600 hover:text-indigo-900">
            Edit
          </.link>
          <.link
            phx-click="delete"
            phx-value-id={game.id}
            class="text-red-600 hover:text-red-900 ml-4"
          >
            Delete
          </.link>
        </:action>
      </.table>
    </div>
    """
  end

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    {:ok, assign(socket, page_title: "Host A Game", games: list_games())}
  end

  defp list_games do
    [
      %{
        id: 1,
        title: "Hacienda Heights Pickup Game",
        time: "January 1, 2025 6:00PM",
        num_players: 10,
        location: "1234 Basketball Court, Hacienda Heights, CA",
        status: "Scheduled",
        type: :draft
      },
      %{
        id: 2,
        title: "Average Hoopers Basketball Game",
        time: "February 1, 2025 7:00PM",
        num_players: 20,
        location: "5678 Sports Center, Los Angeles, CA",
        status: "Completed",
        type: :draft
      },
      %{
        id: 3,
        title: "Sunday Fun Game",
        time: "March 1, 2025 5:00PM",
        num_players: 15,
        location: "91011 Community Gym, Pasadena, CA",
        status: "Cancelled",
        type: :draft
      }
    ]
  end
end
