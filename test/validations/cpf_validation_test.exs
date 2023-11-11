defmodule Algorithms.Validation.CPFValidationTest do
  use ExUnit.Case

  alias Algorithms.Validation.CPFValidation

  describe "call/1" do
    test "when ?" do
      response = CPFValidation.build("111.444.777-35")
      IO.inspect(response)
    end
  end
end
