defmodule Integrator.DataProcessor do
  import Integrator.Structs.Sale

  def process(data) do
    Enum.group_by(data, fn data -> {data["data_venda"], data["vendedor_cpf"]} end)
    |> Enum.map(fn {_k, v} ->
      %Integrator.Structs.Sale{
        data_venda: List.first(v)["data_venda"],
        loja_cnpj: List.first(v)["loja_cnpj"],
        vendedor_cpf: List.first(v)["vendedor_cpf"],
        vendedor_id: List.first(v)["vendedor_id"],
        quantidade_pecas: Enum.sum(Enum.map(v, fn x -> x["quantidade_pecas"] end)),
        quantidade_vendas: Enum.sum(Enum.map(v, fn x -> x["quantidade_vendas"] end)),
        valor_vendas: Enum.sum(Enum.map(v, fn x -> x["valor_vendas"] end))
      }
    end)
  end
end
