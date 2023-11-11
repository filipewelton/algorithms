defmodule Algorithms.String.HighestFrequencyCharTest do
  use ExUnit.Case

  alias Algorithms.String.HighestFrequencyChar

  describe "build/1" do
    test "when passing an text" do
      text = "Pneumonoultramicroscopicsilicovolcanoconiosis"
      response = HighestFrequencyChar.build(text)
      expected_response = {"o", 9}

      assert response == expected_response
    end
  end
end
