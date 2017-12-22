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
    Redix.command(conn, ["lrange", key, start, stop])
  end

  defp index conn, key, i do
    Redix.command(conn, ["lindex", key, i])
  end




end
