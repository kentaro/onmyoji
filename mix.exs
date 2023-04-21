defmodule Onmyoji.MixProject do
  use Mix.Project

  def project do
    [
      app: :onmyoji,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Onmyoji.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:bandit, "~> 0.7.6"},
      {:jason, "~> 1.4.0"},
      {:corsica, "~> 1.3.0"}
    ]
  end
end
