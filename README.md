# Levenshtein

Levenshtein distance implementation in Elixir.

Credits go to the Elixir language source code where it was removed from in 2015:
[GitHub PR](https://github.com/elixir-lang/elixir/pull/3112/commits/b962ae3e5fda2fd5b1ca28a8aa307657d33e9101).

## Installation

The package can be installed
by adding `levenshtein` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:levenshtein, "~> 0.3.0"}
  ]
end
```

## Usage

```elixir
iex> Levenshtein.distance("this", "that")
2
iex> Levenshtein.distance("kitten", "sitting")
3
```
