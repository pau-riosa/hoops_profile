defmodule HoopsProfileWeb.PlayerLive do
  @moduledoc false
  use HoopsProfileWeb, :live_view

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <div class="relative z-40 hidden lg:hidden" id="filters-menu" role="dialog" aria-modal="true">
      <div class="fixed inset-0 bg-black bg-opacity-25"></div>
      <div class="fixed inset-0 z-40 flex">
        <div
          class="relative ml-auto flex h-full w-full max-w-xs flex-col overflow-y-auto bg-white py-4 pb-6 shadow-xl"
          phx-click-away={JS.add_class("hidden", to: "#filters-menu")}
        >
          <div class="flex items-center justify-between px-4">
            <h2 class="text-lg font-medium text-gray-900">Filters</h2>
            <button phx-click={JS.add_class("hidden", to: "#filters-menu")}>
              <span class="sr-only">Close menu</span>
              <.icon name="hero-x-mark" class="h-6 w-6" />
            </button>
          </div>
          <.simple_form for={@form} id="mobile_filters" phx-change="search">
            <div id="m-filter-levels" class="pb-4 pt-4">
              <fieldset>
                <legend class="w-full px-2">
                  <button
                    type="button"
                    aria-controls="filter-section-1"
                    aria-expanded="false"
                    class="flex w-full items-center justify-between p-2 text-gray-400 hover:text-gray-500"
                    phx-click={
                      JS.toggle(to: "#m-filter-levels .open")
                      |> JS.toggle(to: "#m-filter-levels .close")
                      |> JS.toggle(to: "#m-filter-levels .options")
                    }
                  >
                    <span class="text-sm font-bold text-gray-900">Position</span>
                    <span class="ml-6 flex h-7 items-center">
                      <.icon name="hero-chevron-down" class="h-5 w-5 open hidden" />
                      <.icon name="hero-chevron-down" class="h-5 w-5 -rotate-180 close block" />
                    </span>
                  </button>
                </legend>
                <div class="px-4 py-4 options block">
                  <div class="space-y-6">
                    <div class="flex items-center">
                      <.input
                        type="checkbox"
                        name="search[positions][]"
                        value="1"
                        class="form-checkbox"
                      />
                      <span class="ml-2 text-sm text-gray-700">Center</span>
                    </div>

                    <div class="flex items-center">
                      <.input
                        type="checkbox"
                        name="search[positions][]"
                        value="1"
                        class="form-checkbox"
                      />
                      <span class="ml-2 text-sm text-gray-700">Forward</span>
                    </div>

                    <div class="flex items-center">
                      <.input
                        type="checkbox"
                        name="search[positions][]"
                        value="1"
                        class="form-checkbox"
                      />
                      <span class="ml-2 text-sm text-gray-700">Wing</span>
                    </div>

                    <div class="flex items-center">
                      <.input
                        type="checkbox"
                        name="search[positions][]"
                        value="1"
                        class="form-checkbox"
                      />
                      <span class="ml-2 text-sm text-gray-700">Guard</span>
                    </div>
                  </div>
                </div>
              </fieldset>
            </div>
          </.simple_form>
        </div>
      </div>
    </div>
    <div class="mx-auto max-w-7xl mt-10 px-3 lg:px-0">
      <.header>
        Find great players
        <:subtitle>
          Whether you're a coach, scout, or sports enthusiast, our resource will help you find the top talent you're looking for to elevate your team or simply celebrate their incredible abilities. Join us in the quest to find great players who redefine the game."
        </:subtitle>
      </.header>
      <div class="pt-6 lg:pt-12 lg:grid lg:grid-cols-3 lg:gap-x-8 xl:grid-cols-4">
        <aside>
          <h2 class="sr-only">Filters</h2>
          <button
            type="button"
            class="px-1 py-3 rounded-md inline-flex items-center lg:hidden"
            phx-click={JS.remove_class("hidden", to: "#filters-menu")}
          >
            <span class="text-sm font-medium text-gray-700">Filters</span>
            <.icon name="hero-plus" class="ml-1 h-5 w-5 flex-shrink-0 text-gray-400" />
          </button>
          <div class="hidden lg:block">
            <.simple_form for={@form} id="desktop_filters" phx-change="search">
              <div id="filter-levels" class="pb-4 pt-4">
                <fieldset>
                  <legend class="w-full px-2">
                    <button
                      type="button"
                      aria-controls="filter-section-1"
                      aria-expanded="false"
                      class="flex w-full items-center justify-between p-2 text-gray-400 hover:text-gray-500"
                      phx-click={
                        JS.toggle(to: "#filter-levels .open")
                        |> JS.toggle(to: "#filter-levels .close")
                        |> JS.toggle(to: "#filter-levels .options")
                      }
                    >
                      <span class="text-sm font-bold text-gray-900">Position</span>
                      <span class="ml-6 flex h-7 items-center">
                        <.icon name="hero-chevron-down" class="h-5 w-5 open hidden" />
                        <.icon name="hero-chevron-down" class="h-5 w-5 -rotate-180 close block" />
                      </span>
                    </button>
                  </legend>
                  <div class="px-4 py-4 options block">
                    <div class="space-y-6">
                      <div class="flex items-center">
                        <.input
                          type="checkbox"
                          name="search[positions][]"
                          value="1"
                          class="form-checkbox"
                        />
                        <span class="ml-2 text-sm text-gray-700">Center</span>
                      </div>

                      <div class="flex items-center">
                        <.input
                          type="checkbox"
                          name="search[positions][]"
                          value="1"
                          class="form-checkbox"
                        />
                        <span class="ml-2 text-sm text-gray-700">Forward</span>
                      </div>

                      <div class="flex items-center">
                        <.input
                          type="checkbox"
                          name="search[positions][]"
                          value="1"
                          class="form-checkbox"
                        />
                        <span class="ml-2 text-sm text-gray-700">Wing</span>
                      </div>

                      <div class="flex items-center">
                        <.input
                          type="checkbox"
                          name="search[positions][]"
                          value="1"
                          class="form-checkbox"
                        />
                        <span class="ml-2 text-sm text-gray-700">Guard</span>
                      </div>
                    </div>
                  </div>
                </fieldset>
              </div>
            </.simple_form>
          </div>
        </aside>
      </div>
    </div>
    """
  end

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    form = to_form(%{search: %{positions: []}}, as: :search)
    {:ok, socket, temporary_assigns: [form: form, page_title: "Find great players"]}
  end

  @impl Phoenix.LiveView
  def handle_event("search", _params, socket) do
    {:noreply, socket}
  end
end
