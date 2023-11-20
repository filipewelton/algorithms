defmodule Algorithms.Validation.ValidateCPFTest do
  use ExUnit.Case

  alias Algorithms.Validation.ValidateCPF

  describe "call/1" do
    test "when CPF is valid" do
      cpf = "111.444.777-35"
      response = ValidateCPF.call(cpf)
      assert {:ok, "valid"} = response
    end

    test "when CPF is invalid" do
      cpf = "111.444.777-11"
      response = ValidateCPF.call(cpf)

      assert {:error, "invalid"} = response
    end
  end
end
