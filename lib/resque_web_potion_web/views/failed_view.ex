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
    (size(conn) / page_size(conn)) / 1
    |> Float.ceil
    |> round
  end

  def start conn do
    page_size(conn) * (page(conn) - 1) + 1
  end

  def last conn do
    start(conn) + Enum.count(failures(conn)) - 1
  end

  def failures conn do
    conn.assigns[:failures]
  end

  def pagination_pages conn do
    if (num_pages(conn) > 7) do
      # this specifies the range of pages we want to show in the middle
      min = max(page(conn) - 3, 2)
      max = min(page(conn) + 3, num_pages(conn)-1)
      accumulate_pagination_list conn, min, max, 1, []
   else
     1..7 |> Enum.to_list
   end
  end

  def accumulate_pagination_list conn, min, max, 1, _accumulated do
    if (min > 3) do
      accumulate_pagination_list conn, min, max, min, [1, "..."]
    else
      accumulate_pagination_list conn, min, max, min, [1]
    end
  end


  def accumulate_pagination_list conn, min, max, i, accumulated do
    if( i > max ) do
      if (max < num_pages(conn)-1) do
        accumulated ++ ["...", num_pages(conn)]
      else
        accumulated ++ [num_pages(conn)]
      end
    else
      accumulate_pagination_list conn, min, max, i+1, accumulated++[i]
    end
  end





end
