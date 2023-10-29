defmodule HoopsProfileWeb.ErrorJSONTest do
  use HoopsProfileWeb.ConnCase, async: true

  test "renders 404" do
    assert HoopsProfileWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert HoopsProfileWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
