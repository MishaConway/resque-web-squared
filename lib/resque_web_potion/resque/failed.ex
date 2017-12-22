defmodule ResqueWebPotion.Resque.Failed do
  use ResqueWebPotion.Redis.Namespacing
  use ResqueWebPotion.Redis.Client

  def failed_size do
    ResqueWebPotion.Redis.Lists.size client(), namespace("failed")
  end

  def failed page, page_size do
    start = page_size * (page - 1)
    last = start + page_size
    ResqueWebPotion.Redis.Lists.range client(), namespace("failed"), start, last
  end

end
