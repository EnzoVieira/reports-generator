defmodule ReportsGenerator do
  def build(filename) do
    case File.read("reports/#{filename}") do
      {:ok, result} -> result
      {:error, error} -> error
      _ -> "chamada default"
    end
  end
end
