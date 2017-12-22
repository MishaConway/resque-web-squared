defmodule ResqueWebPotionWeb.FailedView do
  use ResqueWebPotionWeb, :view

  def size conn do
    conn.assigns[:size]
  end

  def page conn do
    conn.assigns[:page]
  end

  def page_size conn do
    conn.assigns[:page_size]
  end

  def num_pages conn do
    size(conn) / page_size(conn)
  end

  def start conn do
    page_size(conn) * (page(conn) - 1)
  end

  def last conn do
    start(conn) + page_size(conn)
  end

  def failures conn do
    conn.assigns[:failures]
  end


end
