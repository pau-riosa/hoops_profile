defmodule HoopsProfileWeb.HomeLive do
  @moduledoc false
  use HoopsProfileWeb, :live_view

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <div class="relative -mt-3">
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
                Uncover a World of Exceptional Athletes
              </h1>
              <p class="mt-6 text-lg leading-8 text-gray-600">
                HoopsProfile provides a dynamic and all-encompassing platform that caters to the diverse needs of the basketball community, connecting players, coaches, and fans, while promoting skill growth, sportsmanship, and lifelong love for the game.
              </p>
              <div class="mt-10 flex items-center gap-x-6">
                <.link
                  navigate={~p"/users/register"}
                  class="inline-flex items-center focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 border text-center rounded-md px-3 py-2 text-sm font-medium leading-4 border-transparent bg-brand text-white shadow-sm hover:bg-blue-700/50 px-3.5 py-2.5"
                >
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
    <div class="overflow-hidden bg-gray-900 py-24 sm:py-32">
      <div class="mx-auto max-w-7xl px-6 lg:px-8">
        <div class="mx-auto grid max-w-2xl grid-cols-1 gap-x-8 gap-y-16 sm:gap-y-20 lg:mx-0 lg:max-w-none lg:grid-cols-2">
          <div class="lg:ml-auto lg:pl-4 lg:pt-4">
            <div class="lg:max-w-lg">
              <h2 class="text-base font-semibold leading-7 text-indigo-400">
                Empower, Connect, Inspire
              </h2>
              <p class="mt-2 text-3xl font-bold tracking-tight text-gray-300 sm:text-4xl">
                What is HoopsProfile?
              </p>
              <p class="mt-6 text-lg leading-8 text-gray-200">
                To create a welcoming and inclusive community that connects players, coaches, and fans, encouraging collaboration, mentorship, and a sense of belonging within the basketball world.
              </p>
              <dl class="mt-10 max-w-xl space-y-8 text-base leading-7 text-gray-600 lg:max-w-none">
                <div class="relative pl-9">
                  <dt class="inline font-semibold text-gray-300">
                    <.icon
                      name="hero-user-solid"
                      class="absolute left-1 top-1 h-5 w-5 text-indigo-400"
                    /> Empower Basketball Aspirants
                  </dt>
                </div>

                <div class="relative pl-9">
                  <dt class="inline font-semibold text-gray-300">
                    <.icon
                      name="hero-user-group-solid"
                      class="absolute left-1 top-1 h-5 w-5 text-indigo-400"
                    /> Connect the Basketball Community
                  </dt>
                </div>
                <div class="relative pl-9">
                  <dt class="inline font-semibold text-gray-300">
                    <.icon
                      name="hero-heart-solid"
                      class="absolute left-1 top-1 h-5 w-5 text-indigo-400"
                    /> Inspire Lifelong Love for Basketball
                  </dt>
                </div>
              </dl>
            </div>
          </div>
          <div class="flex items-start justify-end lg:order-first">
            <img
              src={~p"/images/image-100.png"}
              alt="Find the right team-player match with HoopsProfile"
              class="w-[48rem] max-w-none rounded-xl shadow-xl ring-1 ring-gray-400/10 sm:w-[57rem]"
            />
          </div>
        </div>
      </div>
    </div>
    <div class="bg-white">
      <div class="mx-auto max-w-7xl px-6 py-24 sm:pt-32 lg:px-8 lg:py-40">
        <div class="lg:grid lg:grid-cols-12 lg:gap-8">
          <div class="lg:col-span-5">
            <h2 class="text-2xl font-bold leading-10 tracking-tight text-gray-900">
              Frequently asked questions
            </h2>
            <p class="mt-4 text-base leading-7 text-gray-600">
              If you can't find the answer you're looking for in this section, please don't hesitate to contact us by email
              <.link
                href="mailto:support@hoopsprofile.com"
                class="font-semibold text-indigo-600 hover:text-indigo-500"
              >
                support@hoopsprofile.com
              </.link>
            </p>
          </div>
          <div class="mt-10 lg:col-span-7 lg:mt-0">
            <dl class="space-y-10">
              <div>
                <dt class="text-base font-semibold leading-7 text-black">
                  Does HoopsProfile cost anything for players?
                </dt>
                <dd class="mt-2 text-base leading-7 text-gray-600">
                  HoopsProfile is always free for players. We are committed to providing a free platform for players to showcase their skills and connect with coaches and teams.
                </dd>
              </div>
              <div>
                <dt class="text-base font-semibold leading-7 text-black">
                  So what is the subscription for?
                </dt>
                <dd class="mt-2 text-base leading-7 text-gray-600">
                  The subscription is for coaches and teams that want to use HoopsProfile to look for and reach out to players. It allows them to access more detailed information about players.
                </dd>
              </div>
              <div>
                <dt class="text-base font-semibold leading-7 text-black">
                  Can I cancel my subscription at any time?
                </dt>
                <dd class="mt-2 text-base leading-7 text-gray-600">
                  Yes, you can cancel your subscription at any time. You will still have access to the subscription until the end of the billing period.
                </dd>
              </div>
            </dl>
          </div>
        </div>
      </div>
    </div>
    <div class="px-6 py-24 sm:px-6 sm:py-32 lg:px-8">
      <div class="mx-auto max-w-3xl text-center">
        <h2 class="text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl">
          Elevate Your Game, Elevate Your Life!
        </h2>
        <p class="mx-auto mt-6 max-w-xl text-lg leading-8 text-gray-600">
          Create your HoopsProfile today for free and start your journey to the next level.
        </p>
        <div class="mt-10 flex items-center justify-center gap-x-6">
          <.link
            navigate={~p"/users/register"}
            class="inline-flex items-center focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 border text-center rounded-md px-3 py-2 text-sm font-medium leading-4 border-transparent bg-brand text-white shadow-sm hover:bg-blue-700/50 px-3.5 py-2.5"
          >
            Get Started
          </.link>
          <.link class="text-sm font-semibold">
            Learn more <.icon name="hero-arrow-small-right" />
          </.link>
        </div>
      </div>
    </div>
    """
  end

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
