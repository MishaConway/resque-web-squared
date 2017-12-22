defmodule ResqueWebPotionWeb.FailedController do
  use ResqueWebPotionWeb, :controller

  def index(conn, _params) do
    render_failures conn, 1
  end

  def page(conn, params) do
    {page_number, _} = params["page"] |> Integer.parse
    render_failures conn, page_number
  end

  defp render_failures conn, page do
    page_size = 3
    size = ResqueWebPotion.Resque.Failed.failed_size
    failures = ResqueWebPotion.Resque.Failed.failed page, page_size
    render conn, "index.html", page: page, page_size: page_size, size: size, failures: failures
  end
end
