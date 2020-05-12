defmodule Cards do
  @moduledoc """
    Provides functions for creating and handling a deck of cards
  """

  @doc """
    Returns an array of strings representing a deck of cards
  """
  @spec create_deck :: [any]
  def create_deck do
    values = [
      "Ace",
      "Two",
      "Three",
      "Four",
      "Five",
      "Six",
      "Seven",
      "Eight",
      "Nine",
      "Jack",
      "Queen",
      "King"
    ]

    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # This could be considered as a compound list comprehension, it loops through all the possible combination
    # between the elements of all the individual comprehensions listed.
    # It's like nesting comprehensions but with a flattened list as a result
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Randomizes the order of the cards in the deck
  """
  @spec shuffle(any) :: [any]
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Determines whether a deck contains a given card

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true
  """
  @spec contains?(any, any) :: boolean
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck. The `hand_size` argument indicates
    how many cards should be in the hand

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, _remainder} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]
  """
  @spec deal(any, integer) :: {[any], [any]}
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Saves the deck into a local folder for future use with the `filename` argument as the name
  """
  @spec save(any, binary | [[any] | char]) :: :ok
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write!("./saved_decks/" <> filename, binary)
  end

  @doc """
    Loads a previusly saved deck that matches the `filename` argument
  """
  def load(filename) do
    case File.read("./saved_decks/" <> filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _} -> "File not found"
    end
  end

  @doc """
    Creates a deck, shuffles it and deals a hand with the size of the `hand_size` argument
  """
  def create_hand(hand_size) do
    {hand, _rest} = Cards.create_deck() |> Cards.shuffle |> Cards.deal(hand_size)
    hand
  end
end
