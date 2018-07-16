defmodule Levenshtein.MixProject do
  use Mix.Project

  def project do
    [
      app: :levenshtein,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      description: "Elixir wrapper of an Erlang Levenshtein distance implementation",
      deps: deps(),
      package: package(),
      name: "Levenshtein",
      source_url: "https://github.com/preciz/levenshtein"
    ]
  end

  def application do
    [
      extra_applications: []
    ]
  end

  defp deps do
    []
  end

  defp package() do
    [
      maintainers: ["Barna Kovacs"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/preciz/levenshtein"}
    ]
  end
end
