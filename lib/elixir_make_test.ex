defmodule ElixirMakeTest do
  require Logger
  @moduledoc """
  Documentation for `ElixirMakeTest`.
  """

  @on_load :load_nif

  def load_nif do
    nif_file = '#{Application.app_dir(:elixir_make_test, "priv/libnif")}'

    case :erlang.load_nif(nif_file, 0) do
      :ok -> :ok
      {:error, {:reload, _}} -> :ok
      {:error, reason} -> Logger.warn("Failed to load NIF: #{inspect(reason)}")
    end
  end

  def test(), do: raise("NIF test/0 not implemented")

  @doc """
  Hello world.

  ## Examples

      iex> ElixirMakeTest.hello()
      :world

  """
  def hello do
    :world
  end
end
