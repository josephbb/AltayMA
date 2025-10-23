# Altay 2025 Matters Arising Code
This repository contains the code for reproducing results for a matters arising in response to Altay Et al. 2025, "Following news on social media boosts knowledge, belief accuracy and trust". 

It is intended to be very easy to reproduce and only require that you have [Nix](https://nixos.org/) installed. You'll want to clone this repository to your local machine through

## Install Nix
- [Nix](https://nixos.org/) - provides everything needed


## Clone Repository
If you have git installed you can just clone this repository. Otherwise feel free to download the code to your local machine. 

``` bash
git clone https://github.com/josephbb/AltayMA
cd AltayMA
```

## Reproducing the results
Reproducing the results is simple, and the following will run the analysis on your local machine and generate an html that you can inspect in the browser. You do not need anything else installed, nix will handle the entire environment with a single line and reproduce the results as an .html file. 

```bash
nix develop
```

## For Enthusiasts 

You can open a notebook to adjust the code: 

```bash
just notebook
```