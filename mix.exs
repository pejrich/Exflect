defmodule Exflect.MixProject do
  use Mix.Project

  def project do
    [
      app: :exflect,
      version: "0.3.0",
      description: "An inflection library for singularization/pluralization of English words.",
      package: [
        name: "exflect",
        licenses: ["MIT"],
        links: %{"GitHub" => "https://github.com/pejrich/Exflect"},
        source_url: "https://github.com/pejrich/Exflect",
        files: ~w(lib priv .formatter.exs mix.exs README* LICENSE*
                 CHANGELOG*)
      ],
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :tools]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.14", only: :dev, runtime: false},
      {:benchee, "~> 1.1", only: [:dev, :test]},
      {:jason, "~> 1.4", only: :dev},
      {:inflex, "~> 2.1", only: :test}
    ]
  end
end
