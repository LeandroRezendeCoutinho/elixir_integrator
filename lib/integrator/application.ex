defmodule Integrator.Application do
  alias Integrator.DataFetcher
  alias Integrator.DataProcessor
  alias Integrator.DataSender

  def start(:normal, []) do
    Enum.each(1..10_000, fn n -> process(n) end)
  end

  def process(n) do
    IO.puts(n)

    DataFetcher.fetch()
    |> DataProcessor.process()
    |> DataSender.send()

    # |> IO.inspect()
  end
end
