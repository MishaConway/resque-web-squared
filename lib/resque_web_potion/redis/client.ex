defmodule ResqueWebPotion.Redis.Client do
  defmacro __using__(_opts) do
    quote do
      def client do
        client_ex Process.whereis(:resque_redix)
      end

      defp client_ex nil do
        {:ok, conn} = Redix.start_link("redis://localhost:6379/2", name: :resque_redix)
        conn
      end

      defp client_ex registered_process do
        registered_process
      end
    end
  end
end
