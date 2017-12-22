defmodule ResqueWebPotion.Redis.Sets do
  def size conn, key do
    {:ok, size} = Redix.command(conn, ["SSCARD", key])
    size
  end

  def scan conn, key do
    scan_ex conn, key, [], nil
  end

  defp scan_ex _conn, _key, accumulated, "0" do
    accumulated
  end

  defp scan_ex conn, key, accumulated, cursor do
    {:ok, [new_cursor, list]} = Redix.command(conn, ["SSCAN", key, cursor || 0])
    scan_ex conn, key, accumulated++list, new_cursor
  end
end
