defmodule ResqueWebPotion.Resque.Failed do
  use ResqueWebPotion.Redis.Namespacing
  use ResqueWebPotion.Redis.Client

  def failed do
    ResqueWebPotion.Redis.Sets.scan client(), namespace("failed")
  end

end
