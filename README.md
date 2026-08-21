# Levenshtein

[![test](https://github.com/preciz/levenshtein/actions/workflows/test.yml/badge.svg)](https://github.com/preciz/levenshtein/actions/workflows/test.yml)

Levenshtein distance implementation in Elixir.

## Installation

Add `levenshtein` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:levenshtein, "~> 1.0.0"}
  ]
end
```

## Usage

```elixir
iex> Levenshtein.distance("same", "same")
0
iex> Levenshtein.distance("this", "that")
2
iex> Levenshtein.distance("kitten", "sitting")
3
```

## License

Levenshtein is [MIT licensed](LICENSE).
