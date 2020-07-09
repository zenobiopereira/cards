defmodule Cards do
  @moduledoc """
    Methods to create and handling a deck of cards.
  """

  @doc """
    Returns a list of strings representing a deck of playing cards.
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades","Clubs", "Hearts", "Diamonds"]

    # List comprehension
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Shuffle a given deck.
  """
  def shuffle(deck), do: Enum.shuffle(deck)

# There's nothing special with ?, it's just a way to point to others
# that this function will return a true/false value.
  @doc """
    Check if a given deck contains a given card

  ## Example

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true
  """
  def contains?(deck, card), do: Enum.member?(deck, card)

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    the `hand_size` argument indicates how many cards a hand
    should have.

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 2)
      iex> hand
      ["Ace of Spades", "Two of Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Saves a given deck at a local file
  """
  def save(deck, file_name) do
    binary = :erlang.term_to_binary(deck)
    File.write(file_name, binary)
  end

  @doc """
    Loads a deck from a given local file.
  """
  def load(file_name) do
    case File.read(file_name) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "File not found"
    end
  end

  @doc """
    Create and returns a hand of a given size.

  ## Example

      hand = Cards.create_hand(2)
      hand
      ["Five of Spades", "Five of Hearts"]
  """
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
    |> elem(0)
  end
end
