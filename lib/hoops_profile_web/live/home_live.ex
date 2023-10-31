defmodule HoopsProfileWeb.HomeLive do
  @moduledoc false
  use HoopsProfileWeb, :live_view

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <div class="relative">
      <div class="mx-auto max-w-7xl">
        <div class="relative z-10 pt-8 lg:w-full lg:max-w-2xl">
          <svg
            viewBox="0 0 100 100"
            preserveAspectRatio="none"
            aria-hidden="true"
            class="absolute inset-y-0 right-8 hidden h-full w-80 translate-x-1/2 transform fill-white lg:block"
          >
            <polygon points="0,0 90,0 50,100 0,100"></polygon>
          </svg>
          <div class="relative px-6 py-20 lg:px-0 lg:py-30 lg:pr-0">
            <div class="mx-auto max-w-2xl lg:mx-0 lg:max-w-xl">
              <h1 class="text-4xl font-bold tracking-tight text-gray-900 sm:text-6xl leading-relaxed">
                Elevate Your Game, Build Your Legacy
              </h1>
              <p class="mt-6 text-lg leading-8 text-gray-600">
                HoopsProfile provides a dynamic and all-encompassing platform that caters to the diverse needs of the basketball community, connecting players, coaches, and fans, while promoting skill growth, sportsmanship, and lifelong love for the game.
              </p>
              <div class="mt-10 flex items-center gap-x-6">
                <.link class="inline-flex items-center focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 border text-center rounded-md px-3 py-2 text-sm font-medium leading-4 border-transparent bg-brand text-white shadow-sm hover:bg-blue-700/50 px-3.5 py-2.5">
                  Get Started
                </.link>
                <.link class="text-sm font-semibold">
                  Learn more <.icon name="hero-arrow-small-right" />
                </.link>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="bg-gray-50 hidden lg:block lg:absolute lg:inset-y-0 lg:right-0 lg:w-1/2">
        <img
          class="aspect-[3/2] object-cover lg:aspect-auto lg:h-full lg:w-full"
          src="https://images.unsplash.com/photo-1484634749340-ada5df46442b?auto=format&fit=crop&q=80&w=3576&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
        />
      </div>
    </div>
    <!-- footer -->
    <.footer />
    """
  end

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
