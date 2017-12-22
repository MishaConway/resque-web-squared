defmodule ResqueWebPotion.Redis.Client do
  def client do
    client_ex Process.whereis(:redix)
  end

  defp client_ex nil do
    {:ok, conn} = Redix.start_link("redis://localhost:6379/2", name: :redix)
    conn
  end

  defp client_ex registered_process do
    registered_process
  end
end
