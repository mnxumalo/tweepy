defmodule FileReaderTest do
  @moduledoc false

  import Mock
  use ExUnit.Case

  test "Passing a file should return a string" do
    str = Tweepy.FileReader.get_strings_to_tweet(
                                      Path.join("#{:code.priv_dir(:tweepy)}", "sample.txt")
                                    )
                                    assert str != nil
  end

  test "Will not return a string longer that 140 chars" do
    str = Tweepy.FileReader.get_strings_to_tweet(
                                      Path.join("#{:code.priv_dir(:tweepy)}", "sample.txt")
                                    )
                                    assert String.length(str) <= 140
  end

  test "The string should be trimmed" do
    with_mock File, [read!: fn (_) -> " ABC " end] do
      str = Tweepy.FileReader.get_strings_to_tweet("doesnt_exist.txt")
      assert  str == "ABC"
    end
  end

end
