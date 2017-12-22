defmodule ResqueWebPotionWeb.FailedController do
  use ResqueWebPotionWeb, :controller

  def index(conn, _params) do
    page = 1
    page_size = 3
    size = ResqueWebPotion.Resque.Failed.failed_size
    failures = ResqueWebPotion.Resque.Failed.failed page, page_size
    render conn, "index.html", page: page, page_size: page_size, size: size, failures: failures
  end
end
