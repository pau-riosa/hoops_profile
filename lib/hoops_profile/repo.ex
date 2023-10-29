defmodule HoopsProfile.Repo do
  use Ecto.Repo,
    otp_app: :hoops_profile,
    adapter: Ecto.Adapters.Postgres
end
