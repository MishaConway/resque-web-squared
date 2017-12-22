defmodule ResqueWebPotionWeb.QueuesView do
  use ResqueWebPotionWeb, :view

  def queues conn do
    IO.puts "conn.assigns is #{:i.i conn.assigns}"
    conn.assigns[:queues]
  end


end
