defmodule FileReaderTest do
  @moduledoc """

  """
  use ExUnit.Case

  test "Passing a file should return a string" do
    str = Tweepy.FileReader.get_strings_to_tweet(
                                      Path.join("#{:code.priv_dir(:tweepy)}", "sample.txt")
                                    )
                                    assert str != nil
  end

end
