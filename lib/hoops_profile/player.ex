defmodule HoopsProfile.Player do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  schema "players" do
    field :name, :string

    embeds_one :position, Position, on_replace: :delete do
      field :point_guard, :boolean
      field :shooting_guard, :boolean
      field :small_forward, :boolean
      field :power_forward, :boolean
      field :center, :boolean
      field :defensive_guard, :boolean
      field :defensive_forward, :boolean
    end

    embeds_many :experiences, Experience, on_replace: :delete do
      field :title, :string
      field :month, :integer
      field :year, :integer
      field :description, :string
    end
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> cast_embed(:position,
      required: true,
      with: &position_changeset/2
    )
    |> cast_embed(:experiences,
      required: true,
      with: &experience_changeset/2,
      sort_param: :experiences_sort,
      drop_param: :experiences_drop
    )
  end

  defp position_changeset(%HoopsProfile.Player.Position{} = position, params) do
    position
    |> cast(params, [
      :point_guard,
      :shooting_guard,
      :small_forward,
      :power_forward,
      :center,
      :defensive_guard,
      :defensive_forward
    ])
  end

  defp experience_changeset(%HoopsProfile.Player.Experience{} = experience, params) do
    experience
    |> cast(params, [:title, :month, :year, :description])
  end
end
