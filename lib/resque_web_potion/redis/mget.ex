defmodule ResqueWebPotion.Redis.Mget do
  def mget_in_batches conn, keys, batch_size do
    keys
    |> Chartreuse.Enum.chunk(batch_size)
    |> Enum.map(fn(chunk_keys) ->
      {:ok, values} = Redix.command(conn, ["MGET", chunk_keys])
      values
    end)
    |> Chartreuse.Enum.flatten
  end
end
