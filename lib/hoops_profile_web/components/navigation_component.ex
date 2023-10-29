defmodule HoopsProfileWeb.Components.Navigation do
  @moduledoc false
  use HoopsProfileWeb, :html
  alias HoopsProfile.Accounts.User
  alias HoopsProfileWeb.Components.Icon

  @spec navigation(map()) :: Phoenix.LiveView.Rendered.t()
  def navigation(assigns) do
    ~H"""
    <nav class="bg-white shadow z-30 relative">
      <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <div class="flex h-16 justify-between">
          <div class="flex items-center gap-4">
            <a href="/">
              <img src={~p"/images/logo.svg"} width="36" />
            </a>
            <p class="bg-brand/5 text-brand rounded-full px-2 font-medium leading-6">
              v<%= Application.spec(:phoenix, :vsn) %>
            </p>
          </div>
          <!-- user menu / register and login -->
          <.options current_user={@current_user} />
          <.mobile_menu_button />
        </div>
      </div>
      <.mobile_menu current_user={@current_user} />
    </nav>
    """
  end

  @spec mobile_menu_button(map()) :: Phoenix.LiveView.Rendered.t()
  def mobile_menu_button(assigns) do
    ~H"""
    <div class="-mr-2 flex items-center sm:hidden">
      <button
        type="button"
        class="inline-flex items-center justify-center rounded-md p-2 text-gray-400 hover:bg-gray-100 hover:text-gray-500 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-500 ml-2"
        aria-controls="mobile-menu"
        aria-expanded="false"
      >
        <span class="sr-only">Open main menu</span>
        <Icon.icon
          name="hero-bars-3-solid"
          class="block h-6 w-6 mobile-menu"
          phx-click={
            JS.toggle(to: ".mobile-menu")
            |> JS.remove_class("hidden", to: "#mobile-menu")
          }
        />
        <Icon.icon
          name="hero-x-mark-solid"
          class="hidden h-6 w-6 mobile-menu"
          phx-click={
            JS.toggle(to: ".mobile-menu")
            |> JS.add_class("hidden", to: "#mobile-menu")
          }
        />
      </button>
    </div>
    """
  end

  attr(:current_user, User)
  @spec mobile_menu(map()) :: Phoenix.LiveView.Rendered.t()
  def mobile_menu(assigns) do
    ~H"""
    <div class="sm:hidden hidden" id="mobile-menu">
      <div class="border-t border-gray-200 pb-3 pt-4">
        <ul class="mx-auto space-y-1 px-3">
          <.options_with_current_user :if={!is_nil(@current_user)} {assigns} />
          <.options_without_current_user :if={is_nil(@current_user)} {assigns} />
        </ul>
      </div>
    </div>
    """
  end

  attr(:current_user, User)
  @spec options(map()) :: Phoenix.LiveView.Rendered.t()
  def options(assigns) do
    ~H"""
    <ul class="hidden sm:flex relative z-10 items-center gap-4 px-4 sm:px-6 lg:px-8 justify-end">
      <.options_with_current_user :if={!is_nil(@current_user)} {assigns} />
      <.options_without_current_user :if={is_nil(@current_user)} {assigns} />
    </ul>
    """
  end

  attr(:current_user, User, required: true)
  @spec options_with_current_user(map()) :: Phoenix.LiveView.Rendered.t()
  def options_with_current_user(assigns) do
    ~H"""
    <li class="text-[0.8125rem] leading-6 text-zinc-900">
      <%= @current_user.email %>
    </li>
    <li>
      <.link
        href={~p"/users/settings"}
        class="text-[0.8125rem] leading-6 text-zinc-900 font-semibold hover:text-zinc-700"
      >
        Settings
      </.link>
    </li>
    <li>
      <.link
        href={~p"/users/log_out"}
        method="delete"
        class="text-[0.8125rem] leading-6 text-zinc-900 font-semibold hover:text-zinc-700"
      >
        Log out
      </.link>
    </li>
    """
  end

  @spec options_without_current_user(map()) :: Phoenix.LiveView.Rendered.t()
  def options_without_current_user(assigns) do
    ~H"""
    <li>
      <.link
        href={~p"/users/register"}
        class="text-[0.8125rem] leading-6 text-zinc-900 font-semibold hover:text-zinc-700"
      >
        Register
      </.link>
    </li>
    <li>
      <.link
        href={~p"/users/log_in"}
        class="text-[0.8125rem] leading-6 text-zinc-900 font-semibold hover:text-zinc-700"
      >
        Log in
      </.link>
    </li>
    """
  end
end
