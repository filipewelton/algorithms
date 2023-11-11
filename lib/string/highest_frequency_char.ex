defmodule Algorithms.String.HighestFrequencyChar do
  def build(text) do
    String.split(text, "")
    |> Enum.drop(-1)
    |> Enum.drop(1)
    |> Enum.reduce(%{}, &calculate_frequencies(&1, &2))
    |> Enum.to_list()
    |> Enum.max(fn {_, m}, {_, n} -> m >= n end)
  end

  defp calculate_frequencies(char, acc) do
    if Map.has_key?(acc, char) do
      freq = acc[char] + 1
      Map.replace(acc, char, freq)
    else
      Map.put(acc, char, 1)
    end
  end
end
