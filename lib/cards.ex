defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades","Clubs", "Hearts", "Diamonds"]

    # List comprehension
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck), do: Enum.shuffle(deck)

# There's nothing special with ?, it's just a way to point to others
# that this function will return a true/false value.
  def contains?(deck, card), do: Enum.member?(deck, card)

  def deal(deck, hand_size) do
    deck
    |> Enum.split(hand_size)
    |> elem(0)
  end

  # def save(deck, file_name) do
  #   binary = :erlang.term_to_binary(deck)
  #   File.write(filename, binary)
  # end

  # def load(file_name) do
  #   case File.read(fine_name) do
  #     {:ok, binary} -> :erlang.binary_to_term(binary)
  #     {:error, _reason} -> "File not found"
  #   end
  # end

  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
