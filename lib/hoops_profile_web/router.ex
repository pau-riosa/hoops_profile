defmodule HoopsProfileWeb.Router do
  use HoopsProfileWeb, :router

  import HoopsProfileWeb.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {HoopsProfileWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HoopsProfileWeb do
    pipe_through :browser
  end

  # Other scopes may use custom stacks.
  # scope "/api", HoopsProfileWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:hoops_profile, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: HoopsProfileWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  ## Authentication routes

  scope "/", HoopsProfileWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    live_session :redirect_if_user_is_authenticated,
      on_mount: [
        {HoopsProfileWeb.UserAuth, :redirect_if_user_is_authenticated},
        HoopsProfileWeb.Hooks.ActivePage
      ] do
      live "/users/register", UserRegistrationLive, :new
      live "/users/log_in", UserLoginLive, :new
      live "/users/reset_password", UserForgotPasswordLive, :new
      live "/users/reset_password/:token", UserResetPasswordLive, :edit
    end

    post "/users/log_in", UserSessionController, :create
  end

  scope "/", HoopsProfileWeb do
    pipe_through [:browser, :require_authenticated_user]

    live_session :require_authenticated_user,
      on_mount: [
        {HoopsProfileWeb.UserAuth, :ensure_authenticated},
        HoopsProfileWeb.Hooks.ActivePage
      ] do
      live "/dashboard", DashboardLive, :dashboard
      live "/players/:player_id/edit", EditPlayerProfileLive, :edit_player_profile
      live "/users/settings", UserSettingsLive, :edit
      live "/users/settings/confirm_email/:token", UserSettingsLive, :confirm_email
    end
  end

  scope "/", HoopsProfileWeb do
    pipe_through [:browser]

    delete "/users/log_out", UserSessionController, :delete

    live_session :current_user,
      on_mount: [
        {HoopsProfileWeb.UserAuth, :mount_current_user},
        HoopsProfileWeb.Hooks.ActivePage
      ] do
      live "/", HomeLive, :index
      live "/players", PlayersLive, :index
      live "/players/:player_id", PlayerProfileLive, :player_profile
      live "/users/confirm/:token", UserConfirmationLive, :edit
      live "/users/confirm", UserConfirmationInstructionsLive, :new
    end
  end
end
