defmodule Mcrypt.Mixfile do
  use Mix.Project

  def project do
    [
      app: :mcrypt,
      description: "NIF wrapper around libmcrypt.",
      version: "0.1.0",
      elixir: "~> 1.1",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      compilers: [:make, :elixir, :app],
      aliases: [clean: ["clean", "clean.make"]],
      deps: [
        {:ex_doc, "~> 0.11", only: :dev},
      ],
      package: [
        maintainers: ["Ben Cates <ben@system76.com>"],
        licenses: ["MIT"],
        files: ["lib", "c_src", "priv", "mix.exs", "Makefile", "README.md", "LICENSE.md"],
        links: %{
          "GitHub" => "https://github.com/system76/elixir-mcrypt",
          "Docs" => "http://hexdocs.pm/mcrypt/",
        }
      ]
    ]
  end

  def application, do: []
end
