defmodule Algorithms.Validations.ValidateCNPJTest do
  use ExUnit.Case

  alias Algorithms.Validations.ValidateCNPJ, as: Validate

  describe "build/1" do
    test "when passing a valid CNPJ" do
      response = Validate.call("11.222.333/0001-81")
      assert {:ok, "valid"} = response
    end

    test "when passing an invalid CNPJ" do
      response = Validate.call("11.222.333/0001-11")
      assert {:error, "invalid"} = response
    end
  end
end
