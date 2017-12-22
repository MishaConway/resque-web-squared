defmodule ResqueWebPotion.Redis.Namespacing do
   defmacro __using__(_opts) do
     quote do
       def namespace_list keys do
         keys |> Enum.map(fn(key) -> namespace(key) end )
       end

       def namespace key do
         "resque:#{key}"
       end
     end
   end
end
