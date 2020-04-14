defmodule TweepyTest do
  use ExUnit.Case
  doctest Tweepy

  test "greets the world" do
    assert Tweepy.hello() == :world
  end
end
