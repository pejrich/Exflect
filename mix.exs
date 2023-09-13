defmodule Exflect.MixProject do
  use Mix.Project

  def project do
    [
      app: :exflect,
      version: "0.1.0",
      description: "An inflection library for singularization/pluralization of English words.",
      package: [
        name: "Exflect",
        licences: ["MIT"],
        links: [
          github: "https://github.com/pejrich/Exflect"
        ],
        source_url: "https://github.com/pejrich/Exflect"
      ]
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
      {:benchee, "~> 1.1", only: :test},
      {:inflex, "~> 2.1", only: :test}
    ]
  end
end
