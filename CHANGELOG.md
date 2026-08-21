# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-08-22

### Changed
- Major performance and memory optimization for `Levenshtein.distance/2`:
  - Added prefix and suffix trimming to eliminate identical leading and trailing graphemes before matrix computation.
  - Replaced two-row matrix algorithm with a single-row iterative approach.
  - Swapped inputs to always iterate columns over the shorter string for reduced memory and computation.
  - Replaced `Enum` helper overhead with direct list recursion and `:lists` operations.

### Added
- Comprehensive test suite covering identical strings, empty strings, insertions, deletions, substitutions, mixed operations, Unicode/multibyte grapheme clusters, emojis, whitespace/newlines, symmetry, and triangle inequality properties.

### Fixed
- Fixed typos in documentation and formatted typespec for `Levenshtein.distance/2`.

## [0.3.0] - 2019-10-08

### Changed
- Switched from Erlang implementation to a pure Elixir implementation based on the Wagner-Fischer algorithm.
- Removed Erlang source files (`src/levenshtein.erl`) and `distance_cached` function.

### Added
- Doctests and expanded test cases.
- ExDoc documentation and Hex package metadata.

## [0.2.2] - 2019-09-29

### Fixed
- Fixed `distance_cached` calling the wrong underlying function.

### Added
- Basic test suite.

## [0.2.1] - 2019-06-20

### Added
- Added documentation for `Levenshtein` module and integrated `ex_doc`.

## [0.2.0] - 2018-07-16

### Added
- Initial Hex package release.
- Added `Levenshtein` module wrapping Erlang implementation with caching support (`distance` and `distance_cached`).
- MIT License.

[1.0.0]: https://github.com/preciz/levenshtein/compare/v0.3.0...v1.0.0
[0.3.0]: https://github.com/preciz/levenshtein/compare/v0.2.2...v0.3.0
[0.2.2]: https://github.com/preciz/levenshtein/compare/v0.2.1...v0.2.2
[0.2.1]: https://github.com/preciz/levenshtein/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/preciz/levenshtein/releases/tag/v0.2.0
