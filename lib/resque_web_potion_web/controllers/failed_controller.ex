defmodule ResqueWebPotionWeb.FailedController do
  use ResqueWebPotionWeb, :controller

  def index(conn, _params) do
    queues = ResqueWebPotion.Resque.Queues.queues
    render conn, "index.html", queues: queues
  end
end
