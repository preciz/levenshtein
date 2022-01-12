defmodule Levenshtein.MixProject do
  use Mix.Project

  @version "0.3.0"
  @github "https://github.com/preciz/levenshtein"

  def project do
    [
      app: :levenshtein,
      version: @version,
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "Levenshtein",
      docs: docs(),
      description: "Levenshtein distance implementation in Elixir",
      package: package()
    ]
  end

  def application do
    [
      extra_applications: []
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.27.2", only: :docs}
    ]
  end

  defp package() do
    [
      maintainers: ["Barna Kovacs"],
      licenses: ["MIT"],
      links: %{"GitHub" => @github}
    ]
  end

  defp docs do
    [
      main: "Levenshtein",
      source_ref: "v#{@version}",
      source_url: @github
    ]
  end
end
