defmodule Search.BinarySearch do
  def run(vector, target), do: search(vector, target, 0)

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
