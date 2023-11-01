defmodule HoopsProfileWeb.Components.Logo do
  @moduledoc false
  use HoopsProfileWeb, :html

  @spec logo(map()) :: Phoenix.LiveView.Rendered.t()
  def logo(assigns) do
    ~H"""
    <a href="/" class="flex flex-shrink-0 items-center">
      <img src={~p"/images/logo.svg"} width="250" />
    </a>
    """
  end
end
