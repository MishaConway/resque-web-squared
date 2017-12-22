defmodule ResqueWebPotion.Resque.Workers do
  def workers do
    ResqueWebPotion.Redis.Sets.scan client(), "resque:workers"
  end

  def working do
    working_map
    |> Map.keys
    |> Enum.map(fn(worker_id) ->
      segments = worker_id |> String.split(":")
      host = Enum.at(segments,1)
      pid = Enum.at(segments,2)
      queues = Enum.at(segments,3)
      [id: "#{host}:#{pid}:#{queues}", host: host, pid: pid, queues: queues]
    end)
  end

  def worker_payload conn, worker_id do
    {:ok, payload} = Redix.command(conn, ["GET", namespace("worker:#{worker_id}")])
    payload
  end

  def worker_start_time conn, worker_id do
    {:ok, start_time} = Redix.command(conn, ["GET", namespace("worker:#{worker_id}:started")])
    start_time
  end


  def working_map  do
    keys = workers |> Enum.map(fn(id) -> "worker:#{id}" end)
    values = ResqueWebPotion.Redis.Mget.mget_in_batches client(), namespace_list(keys), 100
    IO.puts "values are #{:i.i values}"


    keys
    |> Enum.with_index
    |> Enum.map( fn {key, i} -> {key, Enum.at(values, i)} end )
    |> Enum.reject(fn{k,v} -> nil == v end )
    |> Enum.into(%{})
  end
end
