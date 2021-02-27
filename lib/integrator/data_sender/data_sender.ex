defmodule Integrator.DataSender do
  def send(data) do
    url = "http://localhost:4567/receive"
    headers = [{"Content-Type", "application/json"}]
    body = Jason.encode!(data)
    HTTPoison.post(url, body, headers)
  end
end
