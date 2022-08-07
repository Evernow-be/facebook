defmodule Facebook.MixProject do
  use Mix.Project

  @description """
  Facebook Graph API Wrapper written in Elixir.
  Please note, this is very much a work in progress. Feel free to contribute using pull requests.
  """

  def project do
    [
      app: :facebook,
      version: "0.1.0",
      compilers: Mix.compilers(),
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      description: @description,
      package: package(),
      deps: deps(),
      aliases: aliases(),
      source_url: "https://github.com/Evernow-be/facebook"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Facebook, []},
      extra_applications: [:logger, :crypto],
      env: [
        app_access_token: nil,
        app_id: nil,
        app_secret: nil,
        env: :dev,
        graph_url: "https://graph.facebook.com",
        graph_video_url: "https://graph-video.facebook.com",
        request_conn_timeout: nil,
        request_recv_timeout: nil
      ]
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/Evernow-be/facebook"},
      maintainers: ["Yuri S."]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.6", only: :dev, runtime: false},
      {:ex_doc, "~> 0.28", only: :dev},
      {:httpoison, "~> 1.8"},
      {:jason, "~> 1.3"},
      {:mix_test_watch, "~> 1.1", only: :dev, runtime: false},
      {:mock, "~> 0.3", only: :test}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "ecto.setup"],
      upgrade: ["cmd rm -rf _build deps mix.lock", "deps.get"]
    ]
  end
end
