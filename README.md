# Altay 2025 Matters Arising Code

## Requirements

**Option 1 (Recommended):**
- [Nix](https://nixos.org/) - provides everything needed

**Option 2 (Manual):**
- Python 3.12+
- [uv](https://docs.astral.sh/uv/) (Python package manager)  
- [just](https://github.com/casey/just) (command runner)

## Reproducing the results
Reproducing the results is simple 
### With Nix (recommended)
```bash
nix develop
```

### With uv only
```bash
uv sync
```

## Usage

```bash
# Reproduce and start Jupyter notebook
just notebook

# Reproduce and export to HTML
just export
```