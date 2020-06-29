defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  @deck Cards.create_deck()

  test "Should create an array of card" do
    assert Cards.create_deck()
  end

  test "Should shuffle the array of cards" do
    assert Cards.shuffle(@deck) != @deck
  end

  test "Should check if card exist in deck" do
    assert Cards.contains?(@deck, "Two of Clubs") == true
    assert Cards.contains?(@deck, "Three of Hearts") == true
    assert Cards.contains?(@deck, "King of Hearts") == false
    assert Cards.contains?(@deck, "Queen of Diamonds") == false
  end

  test "Should return a amount of cards from the top of the deck" do
    assert Cards.deal(@deck, 10) == Enum.split(@deck, 10) |> elem(0)
  end
end
