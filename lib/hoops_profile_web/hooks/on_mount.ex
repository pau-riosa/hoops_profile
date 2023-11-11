defmodule HoopsProfileWeb.Hooks.OnMount do
  @moduledoc """

  Handles the mounting of the liveview

  ## `on_mount` arguments

  * `:handle_active_page` - Assigns the current page to socket assigns.
  * `:default` - Does nothing. Returns `{:cont, socket}`

  """
  use HoopsProfileWeb, :verified_routes
  import Phoenix.LiveView, only: [attach_hook: 4]
  import Phoenix.Component, only: [assign: 2]

  def on_mount(:handle_active_page, _params, _session, socket) do
    {:cont, attach_hook(socket, :active_page, :handle_params, &handle_active_page/3)}
  end

  def on_mount(:default, _params, _session, socket) do
    {:cont, socket}
  end

  defp handle_active_page(_params, _session, socket) do
    active_page = do_handle_active_page(socket.view)

    {:cont, assign(socket, active_page: active_page)}
  end

  defp do_handle_active_page(view) do
    case view do
      HoopsProfileWeb.PlayersLive -> :players
      HoopsProfileWeb.DashboardLive -> :dashboard
      HoopsProfileWeb.HomeLive -> :home
      _ -> :home
    end
  end
end
