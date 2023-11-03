defmodule HoopsProfileWeb.EditPlayerProfileLive do
  @moduledoc false
  use HoopsProfileWeb, :live_view

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-7xl mt-10">
      <.header>
        Edit Player Profile
        <:subtitle>
          Manage your player profile and let coaches, scouts and teams recognize you.
        </:subtitle>
      </.header>
    </div>
    """
  end

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
