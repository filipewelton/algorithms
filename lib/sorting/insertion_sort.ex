defmodule Algorithms.Sorting.InsertionSort do
  def run do
    array = [66, 10, 1, 4, 11, 3]
    handle_mapping(array, [])
  end

  defp handle_mapping(array, _subarray) when array == [], do: array

  defp handle_mapping(array, subarray) do
    IO.inspect(subarray == [])
    [head | tail] = array

    if subarray == [] do
      sb = [head]
      handle_mapping(tail, sb)
    else
    end
  end
end
