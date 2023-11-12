defmodule HoopsProfileWeb.EditPlayerProfileLive do
  @moduledoc false
  use HoopsProfileWeb, :live_view

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-7xl mt-10">
      <.header>
        Edit your Player Profile
        <:subtitle>
          Manage your player profile and let coaches, scouts and teams recognize you.
        </:subtitle>
      </.header>
      <div class="space-y-12 sm:px-5 divide-y">
        <.simple_form :let={_f} for={@form} phx-change="validate">
          <div class="divide-y divide-gray-200">
            <.personal_form form={@form} uploads={@uploads} />
            <.professional_form form={@form} />
            <.vital_stats_form form={@form} />
            <.position_form form={@form} />
            <.experience_form form={@form} />
          </div>
          <.button type="submit">Update my profile!</.button>
        </.simple_form>
      </div>
    </div>
    """
  end

  attr(:uploads, :map, required: true)
  attr(:form, :map, required: true)
  @spec personal_form(map()) :: Phoenix.LiveView.Rendered.t()
  def personal_form(assigns) do
    ~H"""
    <div class="w-full max-w-7xl grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-10 lg:px-8 lg:py-8">
      <div>
        <div>
          <h2 class="text-2xl font-bold text-gray-900">Personal information</h2>
          <p class="mt-2 text-sm leading-6 text-gray-500">
            Personal details about you.
          </p>
        </div>
      </div>

      <div class="md:cols-span-2">
        <div class="max-w-2xl space-y-3">
          <.input field={@form[:name]} label="Name" required />
          <div class="grid grid-cols-1 md:grid-cols-2 gap-x-2">
            <.input field={@form[:birth_date]} label="Birth Date" required />
            <.input field={@form[:city]} label="City" required />
          </div>
          <div class="grid grid-cols-1 md:grid-cols-2 gap-x-2">
            <.input field={@form[:country]} label="Country" required />
            <.input field={@form[:timezone]} label="Timezone" required />
          </div>
          <div class="space-y-2">
            <.label>Avatar</.label>
            <div class="rounded-md px-3 py-2 border border-zinc-300">
              <.live_file_input upload={@uploads.avatar} />
            </div>
          </div>
          <div class="space-y-2">
            <.label>Cover Photo</.label>
            <div class="rounded-md px-3 py-2 border border-zinc-300">
              <.live_file_input upload={@uploads.cover_photo} />
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end

  attr(:form, :map, required: true)
  @spec professional_form(map()) :: Phoenix.LiveView.Rendered.t()
  def professional_form(assigns) do
    ~H"""
    <div class="w-full max-w-7xl grid grid-cols-1 gap-x-8 gap-y-10 md:grid-cols-2 lg:px-8 lg:py-8">
      <div>
        <div class="space-y-2">
          <h2 class="text-2xl font-bold text-gray-900">Professional profile</h2>
          <p class="mt-2 text-sm leading-6 text-gray-500">
            Information describing your professional experience.
          </p>
          <p class="mt-2 text-sm leading-6 text-gray-500">
            Focus on describing what makes you unique as a developer. This is your chance to market yourself to potential employers - sell yourself a little!
          </p>
        </div>
      </div>

      <div class="md:cols-span-2">
        <div class="max-w-2xl space-y-3">
          <div>
            <.input field={@form[:hero]} label="Hero" required />
            <p class="text-sm leading-6 text-gray-500">Summarize yourself as a player in few words</p>
          </div>
          <.input field={@form[:bio]} label="Bio" type="textarea" rows="8" required />
        </div>
      </div>
    </div>
    """
  end

  attr(:form, :map, required: true)
  @spec vital_stats_form(map()) :: Phoenix.LiveView.Rendered.t()
  def vital_stats_form(assigns) do
    ~H"""
    <div class="w-full max-w-7xl grid grid-cols-1 gap-x-8 gap-y-10 md:grid-cols-2 lg:px-8 lg:py-8">
      <div>
        <div class="space-y-2">
          <h2 class="text-2xl font-bold text-gray-900">Vital Statistics</h2>
          <p class="mt-2 text-sm leading-6 text-gray-500">
            Information describing your vital statistics.
          </p>
        </div>
      </div>

      <div class="md:cols-span-2">
        <div class="max-w-2xl space-y-5">
          <div class="grid grid-cols-1 md:grid-cols-2 gap-x-3">
            <div>
              <.input field={@form[:weight]} type="number" label="Weight" required />
              <p class="mt-2 text-sm leading-6 text-gray-500">in kilograms</p>
            </div>
            <div>
              <.input field={@form[:height]} type="number" label="Height" required />
              <p class="mt-2 text-sm leading-6 text-gray-500">in centimeters</p>
            </div>
          </div>
          <div>
            <.input field={@form[:wingspan]} type="number" label="Wingspan" required />
            <p class="mt-2 text-sm leading-6 text-gray-500">in centimeters</p>
          </div>
          <.input field={@form[:bmi]} type="number" label="Body Mass Index (BMI)" required />
        </div>
      </div>
    </div>
    """
  end

  attr(:form, :map, required: true)
  @spec vital_stats_form(map()) :: Phoenix.LiveView.Rendered.t()
  def position_form(assigns) do
    ~H"""
    <div class="w-full max-w-7xl grid grid-cols-1 gap-x-8 gap-y-10 md:grid-cols-2 lg:px-8 lg:py-8">
      <div>
        <div class="space-y-2">
          <h2 class="text-2xl font-bold text-gray-900">Position</h2>
          <p class="mt-2 text-sm leading-6 text-gray-500">
            Information describing the positions you can play.
          </p>
        </div>
      </div>

      <div class="md:cols-span-2">
        <div class="max-w-2xl space-y-5">
          <div class="grid grid-cols-1 md:grid-cols-3 gap-x-8 space-x-3 space-y-3">
            <.inputs_for :let={f_nested} field={@form[:position]}>
              <.input type="checkbox" field={f_nested[:point_guard]} label="Point Guard" />
              <.input type="checkbox" field={f_nested[:defensive_guard]} label="Defensive Guard" />
              <.input type="checkbox" field={f_nested[:shooting_guard]} label="Shooting Guard" />
              <.input type="checkbox" field={f_nested[:shooting_forward]} label="Shooting Forward" />
              <.input type="checkbox" field={f_nested[:power_forward]} label="Power Forward" />
              <.input type="checkbox" field={f_nested[:small_forward]} label="Small Forward" />
              <.input type="checkbox" field={f_nested[:center]} label="Center" />
            </.inputs_for>
          </div>
        </div>
      </div>
    </div>
    """
  end

  attr(:form, :map, required: true)
  @spec experience_form(map()) :: Phoenix.LiveView.Rendered.t()
  def experience_form(assigns) do
    ~H"""
    <div class="w-full max-w-7xl grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-10 lg:px-8 lg:py-8">
      <div>
        <div>
          <h2 class="text-2xl font-bold text-gray-900">Experience</h2>
          <p class="mt-2 text-sm leading-6 text-gray-500">
            Information about your experience as a player.
          </p>
        </div>
      </div>
      <div class="md:cols-span-2">
        <div class="max-w-2xl space-y-3 ">
          <.inputs_for :let={f_nested} field={@form[:experiences]}>
            <div class="experiences">
              <input type="hidden" name="player[experiences_sort][]" value={f_nested.index} />
              <label class="flex items-center justify-end">
                <input
                  type="checkbox"
                  name="player[experiences_drop][]"
                  value={f_nested.index}
                  class="hidden"
                />
                <.icon name="hero-x-mark" class="w-6 h-6 relative top-2" />
              </label>
              <div class="w-full space-y-3">
                <.input field={f_nested[:title]} label="Title" />
                <div class="grid grid-cols-1 md:grid-cols-2 gap-x-3">
                  <.input field={f_nested[:month]} label="Month" />
                  <.input field={f_nested[:year]} label="Year" />
                </div>
                <.input
                  type="textarea"
                  field={f_nested[:description]}
                  label="Tell us about your experience"
                  rows="8"
                />
              </div>
            </div>
          </.inputs_for>
          <input type="hidden" name="player[experiences_drop][]" />
          <label class="w-1/3 block cursor-pointer border bg-brand px-3 py-2 text-white font-md rounded-md">
            <input type="checkbox" name="player[experiences_sort][]" class="hidden" />
            Add more experience
          </label>
        </div>
      </div>
    </div>
    """
  end

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    changeset =
      HoopsProfile.Player.changeset(%HoopsProfile.Player{
        experiences: [%HoopsProfile.Player.Experience{}],
        position: %HoopsProfile.Player.Position{}
      })

    form = to_form(changeset, as: :player)

    {:ok,
     socket
     |> assign(:form, form)
     |> assign(page_title: "Edit Player Profile")
     |> assign(:uploaded_avatar, [])
     |> assign(:uploaded_cover_photo, [])
     |> allow_upload(:avatar, accept: ~w(.png .jpg .jpeg), max_entries: 1)
     |> allow_upload(:cover_photo, accept: ~w(.png .jpg .jpeg), max_entries: 1)}
  end

  @impl Phoenix.LiveView
  def handle_event("validate", %{"_target" => ["player", "experiences_drop"]}, socket) do
    IO.inspect("experience_drop")
    {:noreply, socket}
  end

  def handle_event("validate", %{"_target" => ["player", "experiences_sort"]}, socket) do
    IO.inspect("experience_sort")
    {:noreply, socket}
  end

  def handle_event("validate", params, socket) do
    IO.inspect(params)
    {:noreply, socket}
  end
end
