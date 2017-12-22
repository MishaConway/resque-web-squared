defmodule ResqueWebPotionWeb.QueuesView do
  use ResqueWebPotionWeb, :view

  def queues conn do
    conn.assigns[:queues]
    |> Enum.map( fn({name, size}) ->
      {queue_name_with_size(name, size), name, queue_classes(name)}
    end)
  end

  def queue_name_with_size name, 0 do
    name
  end

  def queue_name_with_size name, size do
    "#{name} (#{size})"
  end

  def queue_classes :failed do
    "failed"
  end

  def queue_classes name do
    ""
  end
end
