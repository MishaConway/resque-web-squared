defmodule ResqueWebPotionWeb.PageController do
  use ResqueWebPotionWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
