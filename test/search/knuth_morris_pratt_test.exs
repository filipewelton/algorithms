defmodule Search.KnuthMorrisPrattTest do
  use ExUnit.Case

  alias Search.KnuthMorrisPratt

  describe "call/2" do
    test "should print the indices of the text that matches the pattern" do
      text = "ABAAAABAAAAAAAAA"
      pattern = "BAAAAAAAAA"

      KnuthMorrisPratt.call(text, pattern)
    end
  end
end
