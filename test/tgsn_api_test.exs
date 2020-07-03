defmodule TgsnApiTest do
  use ExUnit.Case
  doctest TgsnApi

  test "greets the world" do
    assert TgsnApi.hello() == :world
  end
end
