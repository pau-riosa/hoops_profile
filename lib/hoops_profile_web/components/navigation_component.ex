defmodule HoopsProfileWeb.Components.Navigation do
  @moduledoc false
  use HoopsProfileWeb, :html
  alias HoopsProfile.Accounts.User

  attr(:current_user, User)
  @spec navigation(map()) :: Phoenix.LiveView.Rendered.t()
  def navigation(assigns) do
    ~H"""
    <nav class="bg-white shadow z-30 relative px-0 lg:px-5">
      <div class="mx-auto max-w-7xl px-3 lg:px-0 py-0 lg:py-1">
        <div class="flex items-center h-16 justify-between">
          <.logo />
          <!-- desktop user menu / register and login -->
          <ul
            :if={is_nil(@current_user)}
            class="hidden sm:flex sm:items-center sm:justify-between sm:gap-x-3"
          >
            <.link
              href={~p"/users/log_in"}
              class="text-[0.8125rem] border border-gray-200 px-3 py-1 rounded-md leading-6 text-zinc-900 font-semibold hover:text-zinc-700"
            >
              Log in
            </.link>
            <.link
              href={~p"/users/register"}
              class="text-[0.8125rem] border border-brand bg-brand px-3 py-1 rounded-md leading-6 text-white font-semibold hover:bg-blue-700/80 hover:border-transparent"
            >
              Register
            </.link>
          </ul>
          <div :if={@current_user} class="relative">
            <.avatar
              user={@current_user}
              phx-click={
                JS.toggle(
                  to: "#user-menu",
                  in: {"ease-out duration-300", "opacity-0", "opacity-100"},
                  out: {"ease-out duration-300", "opacity-100", "opacity-0"},
                  time: 300
                )
              }
            />
            <div
              phx-click-away={JS.hide(to: "#user-menu")}
              id="user-menu"
              class="absolute right-0 z-10 mt-5 w-fit min-w-[200px] whitespace-nowrap origin-top-right rounded-md bg-white divide-y divide-gray-100 py-1 shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none hidden"
            >
              <ul class="mx-auto space-y-1 px-3 ">
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
              </ul>
            </div>
          </div>
          <!-- mobile user menu / register and login -->
          <div class="-mr-2 flex items-center sm:hidden">
            <button
              type="button"
              class="inline-flex items-center justify-center rounded-md p-2 text-gray-400 hover:bg-gray-100 hover:text-gray-500 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-500 ml-2"
              aria-controls="mobile-menu"
              aria-expanded="false"
            >
              <span class="sr-only">Open main menu</span>
              <.icon
                name="hero-bars-3-solid"
                class="block h-6 w-6 mobile-menu"
                phx-click={
                  JS.toggle(to: ".mobile-menu")
                  |> JS.remove_class("hidden",
                    to: "#mobile-menu"
                  )
                }
              />
              <.icon
                name="hero-x-mark-solid"
                class="hidden h-6 w-6 mobile-menu"
                phx-click={
                  JS.toggle(to: ".mobile-menu")
                  |> JS.add_class("hidden",
                    to: "#mobile-menu"
                  )
                }
              />
            </button>
          </div>
        </div>
      </div>
      <!-- mobile user menu / register and login -->
      <div
        class="sm:hidden hidden absolute z-50 bg-white border border-b-2 border-gray-200 w-full"
        id="mobile-menu"
      >
        <div class="border-t border-gray-200 pb-3 pt-4">
          <ul :if={@current_user} class="mx-auto space-y-1 px-3">
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
          </ul>
          <ul :if={is_nil(@current_user)} class="mx-auto-spacey-1 px-3">
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
          </ul>
        </div>
      </div>
    </nav>
    """
  end
end
