defmodule HoopsProfileWeb.PlayerProfileLive do
  @moduledoc false
  use HoopsProfileWeb, :live_view

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 mt-3">
      <div class="-mt-3">
        <div>
          <img
            src="https://images.unsplash.com/photo-1546519638-68e109498ffc?auto=format&fit=crop&q=80&w=3580&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
            class="h-36 w-full object-cover lg:h-72"
            width="1216"
            height="288"
            id="cover"
          />
          <div class="mx-auto px-4 sm:px-6 lg:px-8">
            <div class="-mt-12 sm:-mt-16 sm:flex sm:items-end sm:space-x-5">
              <div>
                <img
                  src="https://images.unsplash.com/photo-1522027353578-d23a7be6d503?auto=format&fit=crop&q=80&w=2225&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                  class="blur-sm h-24 w-24 rounded-full ring-4 ring-white sm:h-32 sm:w-32"
                  width="128"
                  height="128"
                  alt="PBA Season 23 MVP | All Defensive Team | All Star | 3x Champion"
                />
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="mx-auto px-4 sm:px-6 lg:px-8 mt-4 grid grid-cols-1 md:divide-x divide-gray-200 md:grid-cols-3">
        <div class="md:col-span-2 md:pr-6">
          <div class="min-w-0 flex-1 grow">
            <h1 class="text-2xl break-words font-bold text-gray-900">
              PBA Season 23 MVP | All Defensive Team | All Star | 3x Champion
            </h1>
            <.link navigate={~p"/pricing"}>
              <span class="inline-flex items-center rounded-md font-medium ring-1 ring-inset px-2 py-1 text-xs bg-gray-50 text-gray-600 ring-gray-500/10 mt-2 ring-gray-600/30 px-3">
                <.icon name="hero-lock-closed mr-2" /> Private Information
              </span>
            </.link>
          </div>
          <div class="divide-y divide-gray-200">
            <div id="skills" class="py-4 space-x-2">
              <span class="inline-flex items-center rounded-md font-medium ring-1 ring-inset px-2 py-1 text-xs bg-indigo-50 text-indigo-700 ring-indigo-700/10 ">
                All Around
              </span>
              <span class="inline-flex items-center rounded-md font-medium ring-1 ring-inset px-2 py-1 text-xs bg-indigo-50 text-indigo-700 ring-indigo-700/10 ">
                Point Guard
              </span>
              <span class="inline-flex items-center rounded-md font-medium ring-1 ring-inset px-2 py-1 text-xs bg-indigo-50 text-indigo-700 ring-indigo-700/10 ">
                Playmaker
              </span>
            </div>
            <div class="py-4 max-w-none prose break-words prose-headings:my-4 prose-ul:my-2 prose-ol:my-2 prose-p:my-2">
              <div :for={_ <- 1..3} class="space-y-4">
                <h3 class="text-lg font-semibold">PBA Season 2023 MVP</h3>
                <p class="text-sm text-gray-500">
                  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                </p>
                <div class="py-4 space-y-4">
                  <p class="text-gray-500">Stats</p>
                  <.link class="block group ring-1 bg-gray-50 text-gray-600 ring-gray-600/30 rounded-lg py-6 px-10 text-center">
                    <.icon name="hero-lock-closed" class="mx-auto h-8 w-8" />
                    <span class="mt-2 block text-sm font-medium text-gray-600">
                      Private Information
                    </span>
                    <span class="mt-1 block text-xs text-gray-500 group-hover:text-gray-400">
                      Information that is only available with business subscription.
                    </span>
                  </.link>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="md:row-span-2 md:pl-6 divide-y divide-gray-200 text-sm font-medium">
          <div class="py-4">
            <span class="text-blue-600">
              <.icon name="hero-check-circle-solid" class="-mt-1 mr-1 inline-block" /> Open to offers
            </span>
          </div>
          <div class="py-4 space-y-4">
            <p class="text-gray-500">Vital Stats</p>
            <div class="space-y-2">
              <div class="flex items-center gap-x-3">
                <p class="text-gray-500">Height</p>
                <p class="text-gray-500">6'4</p>
              </div>
              <div class="flex items-center gap-x-3">
                <p class="text-gray-500">Weight</p>
                <p class="text-gray-500">164 lbs</p>
              </div>
              <div class="flex items-center gap-x-3">
                <p class="text-gray-500">Wingspan</p>
                <p class="text-gray-500">3 m</p>
              </div>
            </div>
          </div>
          <div class="py-4 space-y-4">
            <p class="text-gray-500">Links</p>
            <.link class="block group ring-1 bg-gray-50 text-gray-600 ring-gray-600/30 rounded-lg py-6 px-10 text-center">
              <.icon name="hero-lock-closed" class="mx-auto h-8 w-8" />
              <span class="mt-2 block text-sm font-medium text-gray-600">Private Information</span>
              <span class="mt-1 block text-xs text-gray-500 group-hover:text-gray-400">
                Information that is only available with business subscription.
              </span>
            </.link>
          </div>
        </div>
      </div>
    </div>
    """
  end

  @impl Phoenix.LiveView
  def mount(_params, _uri, socket) do
    {:ok, socket}
  end
end
