defmodule Algorithms.Validations.ValidateCNPJ do
  def call(cnpj) do
    with true <- validate_format(cnpj),
         true <- handle_validations(cnpj) do
      {:ok, "valid"}
    else
      _ -> {:error, "invalid"}
    end
  end

  defp handle_validations(cnpj) do
    digits = parse_digit(cnpj)
    first_digit = Enum.at(digits, -2)
    second_digit = Enum.at(digits, -1)

    with true <- validate_first_digit(digits, first_digit),
         true <- validate_second_digit(digits, second_digit) do
      true
    else
      _ -> false
    end
  end

  defp validate_format(cnpj) do
    Regex.match?(~r/^(\d{2}.\d{3}.\d{3}\/\d{4}-\d{2})$/, cnpj)
  end

  defp parse_digit(cnpj) do
    String.replace(cnpj, ~r/[.\-\/]/, "")
    |> String.split("")
    |> Enum.drop(1)
    |> Enum.drop(-1)
    |> Enum.map(&String.to_integer/1)
  end

  defp validate_first_digit(digits, first_digit) do
    operators = [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
    operands = Enum.slice(digits, 0..11)
    multiply_result = multiply_digits(operators, operands, [])
    sum_result = Enum.sum(multiply_result)
    rest_division = rem(sum_result, 11)

    if rest_division < 2 do
      if first_digit == 0 do
        true
      else
        false
      end
    else
      calculated_digit = 11 - rest_division

      if first_digit == calculated_digit do
        true
      else
        false
      end
    end
  end

  defp validate_second_digit(digits, second_digit) do
    operators = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
    operands = Enum.slice(digits, 0..12)
    multiply_result = multiply_digits(operators, operands, [])
    sum_result = Enum.sum(multiply_result)
    rest_division = rem(sum_result, 11)

    if rest_division < 2 do
      if second_digit == 0 do
        true
      else
        false
      end
    else
      calculated_digit = 11 - rest_division

      if second_digit == calculated_digit do
        true
      else
        false
      end
    end
  end

  defp multiply_digits(operators, _o, acc) when operators == [] do
    acc
  end

  defp multiply_digits(operators, operands, acc) do
    [operator | rest_operators] = operators
    [operand | rest_operands] = operands
    result = operator * operand
    updated_acc = List.insert_at(acc, -1, result)

    multiply_digits(rest_operators, rest_operands, updated_acc)
  end
end
