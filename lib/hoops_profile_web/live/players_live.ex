defmodule HoopsProfileWeb.PlayersLive do
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
          <form id="mobile_filters" phx-change="search" class="divide-y divide-gray-100">
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
                    <span class="text-sm font-bold text-gray-900">Levels</span>
                    <span class="ml-6 flex h-7 items-center">
                      <.icon name="hero-chevron-down" class="h-5 w-5 open hidden" />
                      <.icon name="hero-chevron-down" class="h-5 w-5 -rotate-180 close block" />
                    </span>
                  </button>
                </legend>
                <div class="px-4 py-4 options block">
                  <div class="space-y-6">
                    <div class="flex items-center">
                      <.input type="checkbox" name="search[levels][]" value="1" class="form-checkbox" />
                      <span class="ml-2 text-sm text-gray-700">Pro</span>
                    </div>

                    <div class="flex items-center">
                      <.input type="checkbox" name="search[levels][]" value="1" class="form-checkbox" />
                      <span class="ml-2 text-sm text-gray-700">Semi-pro</span>
                    </div>

                    <div class="flex items-center">
                      <.input type="checkbox" name="search[levels][]" value="1" class="form-checkbox" />
                      <span class="ml-2 text-sm text-gray-700">Collegiate</span>
                    </div>
                    <div class="flex items-center">
                      <.input type="checkbox" name="search[levels][]" value="1" class="form-checkbox" />
                      <span class="ml-2 text-sm text-gray-700">Senior High School</span>
                    </div>
                    <div class="flex items-center">
                      <.input type="checkbox" name="search[levels][]" value="1" class="form-checkbox" />
                      <span class="ml-2 text-sm text-gray-700">Elementary</span>
                    </div>
                  </div>
                </div>
              </fieldset>
            </div>

            <div id="m-filter-positions" class="pb-4 pt-4">
              <fieldset>
                <legend class="w-full px-2">
                  <button
                    type="button"
                    aria-controls="filter-section-1"
                    aria-expanded="false"
                    class="flex w-full items-center justify-between p-2 text-gray-400 hover:text-gray-500"
                    phx-click={
                      JS.toggle(to: "#m-filter-positions .open")
                      |> JS.toggle(to: "#m-filter-positions .close")
                      |> JS.toggle(to: "#m-filter-positions .options")
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
          </form>
        </div>
      </div>
    </div>
    <div class="mx-auto max-w-7xl mt-10 px-3 lg:px-0">
      <.header>
        Find great players
        <:subtitle>
          Whether you're a coach, scout, or sports enthusiast, our resource will help you find the top talent you're looking for to elevate your team or simply celebrate their incredible abilities. Join us in the quest to find great players who will redefine the game.
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
            <form
              method="post"
              id="desktop_filters"
              phx-change="search"
              class="divide-y divide-gray-100"
            >
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
                      <span class="text-sm font-bold text-gray-900">Levels</span>
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
                          name="search[levels][]"
                          value="1"
                          class="form-checkbox"
                        />
                        <span class="ml-2 text-sm text-gray-700">Pro</span>
                      </div>

                      <div class="flex items-center">
                        <.input
                          type="checkbox"
                          name="search[levels][]"
                          value="1"
                          class="form-checkbox"
                        />
                        <span class="ml-2 text-sm text-gray-700">Semi-pro</span>
                      </div>

                      <div class="flex items-center">
                        <.input
                          type="checkbox"
                          name="search[levels][]"
                          value="1"
                          class="form-checkbox"
                        />
                        <span class="ml-2 text-sm text-gray-700">Collegiate</span>
                      </div>
                      <div class="flex items-center">
                        <.input
                          type="checkbox"
                          name="search[levels][]"
                          value="1"
                          class="form-checkbox"
                        />
                        <span class="ml-2 text-sm text-gray-700">Senior High School</span>
                      </div>
                      <div class="flex items-center">
                        <.input
                          type="checkbox"
                          name="search[levels][]"
                          value="1"
                          class="form-checkbox"
                        />
                        <span class="ml-2 text-sm text-gray-700">Elementary</span>
                      </div>
                    </div>
                  </div>
                </fieldset>
              </div>
              <div id="filter-positions" class="pb-4 pt-4">
                <fieldset>
                  <legend class="w-full px-2">
                    <button
                      type="button"
                      aria-controls="filter-section-1"
                      aria-expanded="false"
                      class="flex w-full items-center justify-between p-2 text-gray-400 hover:text-gray-500"
                      phx-click={
                        JS.toggle(to: "#filter-positions .open")
                        |> JS.toggle(to: "#filter-positions .close")
                        |> JS.toggle(to: "#filter-positions .options")
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
            </form>
          </div>
        </aside>
        <!-- Players -->
        <div class="mt-6 lg:col-span-2 lg:mt-0 xl:col-span-3">
          <div class="space-y-16 sm:space-y-24">
            <div class="flow-root mt-4 lg:mt-6">
              <div class="md:-my-6 divide-y divide-gray-100">
                <.link
                  :for={id <- 1..3}
                  navigate={~p"/players/#{id}"}
                  class="flex py-4 md:p-6 rounded-md cursor-pointer md:hover:bg-indigo-100"
                >
                  <div class="min-w-0 flex-1 lg:flex lg:flex-col">
                    <div class="lg:flex-1">
                      <div class="md:flex justify-between align-top">
                        <h4 class="text-md sm:text-lg font-medium text-gray-900">
                          PBA Season 23 MVP | All Defensive Team | All Star | 3x Champion
                        </h4>
                        <p class="flex-none text-sm pt-2 md:ml-6 sm:mt-0">
                          <span class="text-blue-600">
                            <.icon name="hero-check-circle-solid" class="-mt-1 mr-1 inline-block" />
                            Open to offers
                          </span>
                        </p>
                      </div>
                      <div class="mt-2 text-gray-500 hidden sm:block">
                        <p class="line-clamp-5">
                          Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                        </p>
                      </div>
                      <div class="mt-2 sm:flex sm:border-gray-200 text-xs text-gray-400 align-middle sm:mt-4">
                        <div class="space-x-1">
                          <.icon name="hero-trophy" class="-mt-1 mr-1" />
                          <span class="mt-2">MVP</span>
                          <span class="mt-2">Mythical 5</span>
                        </div>
                        <div class="mt-2 sm:mt-0 space-x-1 border-l border-gray-200 sm:pl-4 sm:ml-4">
                          <.icon name="hero-globe-alt" class="-mt-1 mr-1" />
                          <span class="mt-2">Philippines</span>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="ml-4 flex-shrink-0 sm:order-first sm:m-0 sm:mr-6">
                    <img
                      src="https://images.unsplash.com/photo-1522027353578-d23a7be6d503?auto=format&fit=crop&q=80&w=2225&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                      class="blur-sm col-start-2 col-end-3 h-20 w-20 rounded-lg object-cover object-center sm:col-start-1 sm:row-span-2 sm:row-start-1 sm:h-24 sm:w-24 lg:h-36 lg:w-36"
                    />
                  </div>
                </.link>
              </div>
            </div>
          </div>
        </div>
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
