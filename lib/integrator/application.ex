defmodule Integrator.Application do
  alias Integrator.DataFetcher
  alias Integrator.DataProcessor

  def start(:normal, []) do
    Enum.each(1..10_000, fn n -> process(n) end)
  end

  def process(n) do
    IO.puts(n)
    DataFetcher.fetch()
    |> DataProcessor.process()
    # |> IO.inspect
  end
end

# Integrator.start()
