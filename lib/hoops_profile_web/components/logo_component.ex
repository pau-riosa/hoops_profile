defmodule HoopsProfileWeb.Components.Logo do
  @moduledoc false
  use HoopsProfileWeb, :html

  @spec logo(map()) :: Phoenix.LiveView.Rendered.t()
  def logo(assigns) do
    ~H"""
    <div class="flex items-center gap-4">
      <a href="/">
        <img src={~p"/images/logo.svg"} width="250" />
      </a>
      <p class="bg-brand/5 text-brand rounded-full px-2 font-medium leading-6">
        v<%= Application.spec(:hoops_profile, :vsn) %>
      </p>
    </div>
    """
  end
end
