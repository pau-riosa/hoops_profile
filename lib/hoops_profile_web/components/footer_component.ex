defmodule HoopsProfileWeb.Components.Footer do
  @moduledoc false
  use HoopsProfileWeb, :html

  @spec footer(map()) :: Phoenix.LiveView.Rendered.t()
  def footer(assigns) do
    ~H"""
    <div class="mx-auto mt-8 sm:mt-32 max-w-7xl px-3 lg:px-0">
      <footer
        aria-labelledby="footer-heading"
        class="relative border-t border-gray-900/10 py-24 sm:py-32"
      >
        <div class="xl:grid xl:grid-cols-3 xl:gap-8">
          <div class="space-y-4">
            <.link navigate="/"><.logo /></.link>
            <p class="h-8 inline-block align-bottom text-gray-400 text-md">
              © 2023 HoopsProfile All rights reserved.
            </p>
          </div>
        </div>
      </footer>
    </div>
    """
  end
end
