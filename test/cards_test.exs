defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 48 cards" do
    assert length(Cards.create_deck) == 48
  end

  test "shuffle randomizes deck" do
    # There is a very minimal chance that this test fails, because de randomness may still yield the same result
    # so it's not the best use case, but for the sake of learning I decided to leave it here
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck)
  end
end
