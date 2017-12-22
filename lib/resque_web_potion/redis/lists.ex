defmodule ResqueWebPotion.Redis.Lists do
  def size conn, key do
    {:ok, size} = Redix.command(conn, ["llen", key])
    size
  end

  def first conn, key do
    index conn, key, 0
  end

  def last conn, key do
    index conn, key, -1
  end

  def range conn, key, start, stop do
    {:ok, items} = Redix.command(conn, ["lrange", key, start, stop])
    items
  end

  defp index conn, key, i do
    {:ok, item} = Redix.command(conn, ["lindex", key, i])
    item
  end




end
