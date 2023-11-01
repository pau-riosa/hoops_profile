defmodule HoopsProfileWeb.Hooks.ActivePage do
  @moduledoc false
  use HoopsProfileWeb, :live_view

  @impl Phoenix.LiveView
  def on_mount(:default, _params, _session, socket) do
    {:cont, attach_hook(socket, :active_page, :handle_params, &handle_active_page/3)}
  end

  defp handle_active_page(_params, _session, socket) do
    active_page = do_handle_active_page(socket.view)

    {:cont, assign(socket, active_page: active_page)}
  end

  defp do_handle_active_page(view) do
    case view do
      HoopsProfileWeb.PlayersLive -> :players
      HoopsProfileWeb.HomeLive -> :home
      _ -> :home
    end
  end
end
