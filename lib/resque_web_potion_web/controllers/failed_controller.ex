defmodule ResqueWebPotionWeb.FailedController do
  use ResqueWebPotionWeb, :controller

  def index(conn, _params) do
    page = 1
    size = ResqueWebPotion.Resque.Failed.failed_size
    failures = ResqueWebPotion.Resque.Failed.failed page, 20
    render conn, "index.html", page: page, size: size, failures: failures
  end
end
