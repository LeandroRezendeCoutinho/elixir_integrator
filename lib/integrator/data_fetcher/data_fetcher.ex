defmodule Integrator.DataFetcher do
  use HTTPoison.Base

  def fetch do
    {:ok, response} = HTTPoison.get("http://localhost:4567/data")
    Jason.decode!(response.body)
  end
end
