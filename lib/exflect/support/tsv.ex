defmodule Exflect.Support.TSV do
  defmacro priv_path(name, path) do
    quote do
      @path_with_priv :code.priv_dir(:exflect) |> Path.join(unquote(path))
      @external_resource @path_with_priv
      Module.put_attribute(__MODULE__, unquote(name), @path_with_priv)
    end
  end

  defmacro parse_file(path) do
    quote do
      File.read!(unquote(path))
      |> String.trim()
      |> String.split("\n")
      |> Enum.map(&String.split(&1, "\t"))
    end
  end
end
