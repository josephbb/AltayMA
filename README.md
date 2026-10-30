# Altay 2025 Matters Arising Code

This repository contains the code and data for the Matters Arising "Design bias yields misleading effects of following news on social media."

That comment responds to:

Altay, S., Hoes, E. & Wojcieszak, M. Following news on social media boosts knowledge, belief accuracy and trust. *Nature Human Behaviour* (2025). https://doi.org/10.1038/s41562-025-02205-6

The analysis runs on the dataset shipped with this repository, `data/LongFalseAwareFR.csv`. It does not take a replacement dataset.

## System requirements

Nix is the only program you need to install yourself. It builds the rest of the environment from `flake.nix` and `flake.lock`.

The pinned Nixpkgs revision is `01f116e4df6a15f4ccdffb1bcd41096869fb385c` (`nixos-unstable` as of 2025-10-22). From that revision, the shell provides:

| Tool | Version |
| --- | --- |
| Pandoc | 3.7.0.2 |
| uv | 0.8.19 |
| just | 1.58.0 |
| Python | 3.12.13 |

`uv` then creates `.venv` and installs CPython 3.14.6, which is the interpreter that runs the notebook. Direct Python dependencies, at the versions pinned in `uv.lock`:

| Package | Version |
| --- | --- |
| numpy | 2.5.4 |
| pandas | 3.1.0 |
| seaborn | 0.13.2 |
| pymc | 6.3.2 |
| matplotlib | 3.11.2 |
| arviz | 1.3.0 |
| openpyxl | 3.1.5 |
| scipy | 1.18.1 |
| jupyter | 1.1.1 |
| nbconvert | 7.17.2 |
| pandoc (Python package) | 2.4 |

`uv.lock` also pins every transitive dependency used by that install. `pyproject.toml` requires Python 3.12 or newer.

The environment is defined for Nix's default systems, which cover Linux and macOS. It has been tested on:

- macOS 26.6.2 (build 25G83), Apple silicon (arm64)
- Nix 2.34.8 (Determinate Nix 3.21.8)
- CPython 3.14.6, with the package versions in the table above

No non-standard hardware is required. A normal desktop CPU is enough. The model is sampled with 4 chains and does not use a GPU.

## Installation

Install [Nix](https://nixos.org/), then clone the repository:

```bash
git clone https://github.com/josephbb/AltayMA
cd AltayMA
```

If Git is not installed, download the repository archive and unpack it.

On a normal desktop with a broadband connection, the first run takes a few minutes. Almost all of that is the download. On the test machine Nix fetched about 180 MiB, and `uv sync` then installed 133 Python packages in a few seconds. Later runs reuse those downloads.

## Running the analysis

From the repository directory:

```bash
nix develop
```

That command installs the dependencies, then executes `Analysis.ipynb` from top to bottom on `data/LongFalseAwareFR.csv`. This data was pulled from Altay Et. al's [OSF repository](https://osf.io/8tzd2/). When it finishes, the shell prints `Ready! Analysis.html has been generated.`

The run writes:

- `Analysis.html`, the notebook with figures and tables, for viewing in a browser
- `out/apparent_treatment_effect_with_delta.png`
- `out/Variation_by_N.png`
- `out/Power_Curves.png`
- `out/delta_violin_plot.png`
- `out/parameter_table.tex`
- `out/contrast_table.tex`

`out/` is created by the run and is listed in `.gitignore`. These files are the quantitative results reported in the Matters Arising.

After the environment is already installed, the notebook finishes in under a minute on a normal desktop. On the test machine the PyMC sample (1,000 draws after 1,000 tuning steps, 4 chains) and the saved figures were produced in about 20 seconds.

To inspect or edit the notebook after that run, stay in the Nix shell and start Jupyter:

```bash
just notebook
```

## License

Copyright 2025-2026 Joe Bak-Coleman.

This work is licensed under the [Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/) (CC BY 4.0). The license text is in `LICENSE`.
