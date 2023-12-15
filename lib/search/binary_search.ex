defmodule Search.BinarySearch do
  def run(length, target) do
    vector = gen_vector(length, [])

    {vector, search(vector, target, 0)}
  end

  defp gen_vector(n, acc) when n > 0 do
    number = :rand.uniform(n)
    updated = List.insert_at(acc, -1, number)

    gen_vector(n - 1, updated)
  end

  defp gen_vector(_n, acc), do: Enum.sort(acc)

  defp search(vector, target, pointer) when length(vector) > 1 do
    middle = div(length(vector), 2)
    element = Enum.at(vector, middle)

    cond do
      element > target ->
        Enum.slice(vector, Range.new(0, middle - 1))
        |> search(target, pointer)

      element < target ->
        Enum.slice(vector, Range.new(middle, -1))
        |> search(target, pointer + middle)

      true ->
        "Number #{target} is located at index #{pointer + 1}"
    end
  end

  defp search(vector, target, pointer) do
    [element] = vector

    if element == target do
      "Number #{target} is located at index #{pointer + 1} >>"
    else
      "#{target} was not found in the list"
    end
  end
end
