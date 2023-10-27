defmodule Algorithms.BubbleSort do
  def run(list_elements) do
    n_recursion = length(list_elements)

    recursion(list_elements, n_recursion)
  end

  defp recursion(list, acc) do
    if acc == 0 do
      list
    else
      updated_list = sort(list, [])
      recursion(updated_list, acc - 1)
    end
  end

  defp sort(unsorted_list, sorted_list) when length(unsorted_list) == 2 do
    [elem1, elem2] = unsorted_list

    if elem1 > elem2 do
      sorted_list =
        sorted_list
        |> List.insert_at(-1, elem2)
        |> List.insert_at(-1, elem1)

      sorted_list
    else
      sorted_list =
        sorted_list
        |> List.insert_at(-1, elem1)
        |> List.insert_at(-1, elem2)

      sorted_list
    end
  end

  defp sort(unsorted_list, sorted_list) do
    [elem1, elem2 | tail] = unsorted_list

    if elem1 > elem2 do
      sorted_list = List.insert_at(sorted_list, -1, elem2)
      sort([elem1] ++ tail, sorted_list)
    else
      sorted_list = List.insert_at(sorted_list, -1, elem1)
      sort([elem2] ++ tail, sorted_list)
    end
  end
end
