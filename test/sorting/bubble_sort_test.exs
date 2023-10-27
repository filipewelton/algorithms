defmodule Algorithms.BubbleSortTest do
  use ExUnit.Case

  alias Algorithms.BubbleSort

  describe "run/1" do
    test "when a list with 99 elements is provided" do
      unsorted_list =
        Enum.to_list(1..99)
        |> Enum.map(fn _ -> :rand.uniform(99) end)

      bubble_sort_result = BubbleSort.run(unsorted_list)
      expected_response = Enum.sort(unsorted_list)

      assert bubble_sort_result == expected_response
    end
  end
end
