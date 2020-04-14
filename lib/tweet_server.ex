defmodule Tweepy.TweetServer do
  @moduledoc false
  


  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: :tweet_server)
  end

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_call(_msg, _from, state) do
    {:reply, :ok, state}
  end

  def handle_cast({:tweet, tweet}, state) do
    Tweepy.Tweet.send(tweet)
    {:noreply, state}
  end

  def tweet(tweet) do
    GenServer.cast(:tweet_server, {:tweet, tweet})
  end
end