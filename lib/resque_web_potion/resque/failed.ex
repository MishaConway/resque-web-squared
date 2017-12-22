defmodule ResqueWebPotion.Resque.Failed do
  use ResqueWebPotion.Redis.Namespacing
  use ResqueWebPotion.Redis.Client

  def failed_size do
    ResqueWebPotion.Redis.Lists.size client(), namespace("failed")
  end

  def failed page, page_size do
    start = page_size * (page - 1)
    last = start + page_size - 1
    ResqueWebPotion.Redis.Lists.range(client(), namespace("failed"), start, last)
    |> Enum.map(fn(i) ->
      Poison.decode! i
    end)
    |> Enum.map(fn(i) ->
      IO.puts "i is #{:i.i i}"
      args = get_in i, ["payload", "args"]
      {success, lala, decoded_args} = Poison.decode args
      IO.puts "lala is #{:i.i lala}"
      if :ok == success do
        put_in i, ["payload", "args"], decoded_args
      else
        put_in i, ["payload", "args"], "Unable to decode `#{args}`"
      end
      i
    end)
  end

end
