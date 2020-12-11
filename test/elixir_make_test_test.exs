defmodule ElixirMakeTestTest do
  use ExUnit.Case
  doctest ElixirMakeTest

  test "greets the world" do
    assert ElixirMakeTest.hello() == :world
  end
end
