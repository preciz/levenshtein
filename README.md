# Levenshtein

Elixir wrapper for levenshtein implementation in Erlang

Credit: [http://rosettacode.org/wiki/Levenshtein_distance#Erlang](http://rosettacode.org/wiki/Levenshtein_distance#Erlang)


## Installation

The package can be installed
by adding `levenshtein` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:levenshtein, "~> 0.1.0"}
  ]
end
```

## Usage

```elixir
iex> Levenshtein.distance("this", "that")
2
```
