defmodule Integrator.Structs.Sale do
  @derive Jason.Encoder
  defstruct data_venda: nil, loja_cnpj: nil, quantidade_pecas: nil, quantidade_vendas: nil,
   valor_vendas: nil, vendedor_cpf: nil, vendedor_id: nil
end
