defmodule ElixirMakeTest.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_make_test,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      compilers: [:elixir_make] ++ Mix.compilers(),
      aliases: [
        compile: ["clean", &install/1, "compile"]
      ],
      make_clean: ["clean"],
      make_args: ["-j#{:erlang.system_info(:logical_processors_available)}"]

    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:elixir_make, "~> 0.6.2", runtime: false}
    ]
  end

  defp install(_args) do
    System.cmd("make", ["install"])
  end
end
