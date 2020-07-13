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

  test "Should return a given amount of cards from a given deck"
    do
    {hand, _deck} = Cards.deal(@deck, 10)
    assert length(hand) == 10
  end

  test "Should return a hand which matches the given hand_size with valid cards" do
    hand = Cards.create_hand(5)
    assert is_list(hand)
    assert length(hand) == 5
    assert Enum.map(hand, &String.valid?/1)
  end
end
