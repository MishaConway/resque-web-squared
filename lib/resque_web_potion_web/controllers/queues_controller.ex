defmodule ResqueWebPotionWeb.QueuesController do
  use ResqueWebPotionWeb, :controller

  def index(conn, _params) do
    queues = ResqueWebPotion.Resque.Queues.queues ++ [failed: ResqueWebPotion.Resque.Failed.failed_size]
    render conn, "index.html", queues: queues
  end
end
