defmodule Search.KnuthMorrisPratt do
  @spec call(String.t(), String.t()) :: nil
  def call(text, pattern) do
    pattern =
      pattern
      |> String.split("")
      |> List.delete_at(0)
      |> List.delete_at(-1)

    states = set_state(pattern, [0], 0, 1)

    text =
      text
      |> String.split("")
      |> List.delete_at(0)
      |> List.delete_at(-1)

    search(text, pattern, states, 0, 0)
  end

  defp set_state(pattern, aux, j, i) when i < length(pattern) - 1 do
    x1 = Enum.at(pattern, j)
    x2 = Enum.at(pattern, i)

    if x1 == x2 do
      j2 = j + 1
      i2 = i + 1
      aux2 = List.insert_at(aux, i, j2)

      set_state(pattern, aux2, j2, i2)
    else
      aux2 = List.insert_at(aux, i, 0)
      i2 = i + 1

      set_state(pattern, aux2, j, i2)
    end
  end

  defp set_state(pattern, aux, j, i) do
    x1 = Enum.at(pattern, j)
    x2 = Enum.at(pattern, i)

    cond do
      x1 == x2 ->
        j2 = j + 1
        List.insert_at(aux, i, j2)

      x1 != x2 and j != 0 ->
        j2 = Enum.at(aux, j) + 1
        List.insert_at(aux, i, j2)

      x1 != x2 and j == 0 ->
        List.insert_at(aux, i, 0)
    end
  end

  defp search(text, pattern, states, j, i) when j < length(text) do
    pattern_char = Enum.at(pattern, i)
    text_char = Enum.at(text, j)

    cond do
      pattern_char != text_char and i == 0 ->
        j2 = j + 1
        search(text, pattern, states, j2, i)

      pattern_char != text_char and i > 0 ->
        i2 = Enum.at(states, i - 1)
        search(text, pattern, states, j, i2)

      pattern_char == text_char ->
        j2 = j + 1

        if i == length(pattern) - 1 do
          match_index = j - i
          matching = Enum.slice(text, Range.new(match_index, j))

          if check_match(matching, pattern) do
            IO.puts("pattern is found at index #{match_index}")
          end

          i2 = 0
          search(text, pattern, states, j2, i2)
        else
          i2 = i + 1
          search(text, pattern, states, j2, i2)
        end
    end
  end

  defp search(_text, _pattern, _states, _j, _i), do: nil

  defp check_match(text, pattern) do
    t = Enum.join(text)
    p = Enum.join(pattern)

    t === p
  end
end
