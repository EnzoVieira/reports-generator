defmodule ReportsGenerator do
  def build(filename) do
    "reports/#{filename}"
    |> File.stream!()
    |> Enum.reduce(report_acc(), fn line, acc ->
      [id, food_name, price] = parse_line(line)
      Map.put(acc, id, acc[id] + price)
    end)

    # |> Enum.map(&parse_line/1) # Outra forma de escrever a linha anterior
    # |> Enum.map(&parse_line(&1)) # Outra forma de escrever a linha anterior
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(2, &String.to_integer/1)

    # |> List.update_at(2, fn elem -> String.to_integer(elem) end) # Outra forma de escrever a linha anterior
  end

  defp report_acc, do: Enum.into(1..30, %{}, &{Integer.to_string(&1), 0})
end
