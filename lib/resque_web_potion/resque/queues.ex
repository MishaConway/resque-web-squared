defmodule ResqueWebPotion.Resque.Queues do
  use ResqueWebPotion.Redis.Namespacing
  use ResqueWebPotion.Redis.Client

  def queues do
    conn = client()
    ResqueWebPotion.Redis.Sets.scan(conn, namespace("queues"))
    |> Enum.map(fn(queue) ->
        {queue, ResqueWebPotion.Redis.Lists.size(conn, queue_key(queue))}
    end)
  end

  defp queue_key queue do
    namespace "queue:#{queue}"
  end
end
