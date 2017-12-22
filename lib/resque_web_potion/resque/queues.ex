defmodule ResqueWebPotion.Resque.Queues do
  use ResqueWebPotion.Redis.Namespacing
  use ResqueWebPotion.Redis.Client

  def queues do
    ResqueWebPotion.Redis.Sets.scan client(), namespace("queues")
  end

end
