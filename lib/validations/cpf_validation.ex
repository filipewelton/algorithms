defmodule Algorithms.Validation.CPFValidation do
  def build(cpf) do
    {digits, verification_code} =
      String.replace(cpf, ~r/[.-]/, "")
      |> String.split_at(9)

    [first_code, second_code] =
      String.split_at(verification_code, 1)
      |> Tuple.to_list()
      |> Enum.map(fn e -> String.to_integer(e) end)

    calculate_first_code(digits, first_code)
    calculate_second_code(digits, first_code, second_code)
  end

  defp parse_digits(digits) do
    String.split(digits, "")
    |> Enum.drop(1)
    |> Enum.drop(-1)
    |> Enum.map(fn e -> String.to_integer(e) end)
  end

  defp calculate_first_code(digits, first_code) do
    operands = [10, 9, 8, 7, 6, 5, 4, 3, 2]
    operators = parse_digits(digits)
    code = handle_calc(operators, operands, [])

    if code == first_code do
      :ok
    else
      :error
    end
  end

  defp calculate_second_code(digits, first_code, second_code) do
    operands = [11, 10, 9, 8, 7, 6, 5, 4, 3, 2]
    operators = parse_digits(Enum.join([digits, first_code]))
    code = handle_calc(operators, operands, [])

    if code == second_code do
      :ok
    else
      :error
    end
  end

  defp handle_calc(operators, _operands, acc) when operators == [] do
    division_rest =
      Enum.sum(acc)
      |> rem(11)

    if division_rest < 2 do
      0
    else
      11 - division_rest
    end
  end

  defp handle_calc(operators, operands, acc) do
    [m1 | m2] = operators
    [n1 | n2] = operands
    result = m1 * n1
    updated_acc = List.insert_at(acc, -1, result)

    handle_calc(m2, n2, updated_acc)
  end
end
