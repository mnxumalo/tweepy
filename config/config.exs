use Mix.Config

config :tweepy, Tweepy.Scheduler, jobs: [
                                    {"* * * *", fn ->
                                    Tweepy.FileReader.get_strings_to_tweet(
                                      Path.join("#{:code.priv_dir(:tweepy)}", "sample.txt")
                                    )
                                    |> Tweepy.TweetServer.tweet()

                                    end}
]