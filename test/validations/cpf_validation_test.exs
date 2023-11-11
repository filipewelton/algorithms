defmodule Algorithms.Validation.CPFValidationTest do
  use ExUnit.Case

  alias Algorithms.Validation.CPFValidation

  describe "call/1" do
    test "when ?" do
      list = [
        "776.733.160-13",
        "903.869.720-10",
        "324.833.570-08"
      ]

      response = Enum.any?(list, fn e -> :ok = CPFValidation.build(e) end)

      IO.inspect(response)
    end
  end
end
