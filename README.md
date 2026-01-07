# homebrew-ext-pkgs

Homebrew tap for external packages not in the official Homebrew repository.

## Installation

```bash
brew tap wow-look-at-my-code/ext-pkgs
```

## Available Formulas

| Formula | Description |
|---------|-------------|
| `bats-assert` | Common assertions for Bats |
| `bats-support` | Supporting library for Bats |

## Usage

```bash
# Install individual packages
brew install bats-assert
brew install bats-support

# Or install directly without tapping first
brew install wow-look-at-my-code/ext-pkgs/bats-assert
```

## Using with Bats

Add to your test files:

```bash
load "$(brew --prefix bats-support)/load.bash"
load "$(brew --prefix bats-assert)/load.bash"
```

## Automatic Updates

This tap uses GitHub Actions to automatically check for new upstream releases daily. When updates are found, a PR is created automatically.

## License

The formulas in this tap are metadata files. The upstream packages have their own licenses:
- bats-support: CC0-1.0
- bats-assert: CC0-1.0
