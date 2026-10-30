# Install dependencies
install:
    uv sync

# Run Jupyter notebook
notebook:
    uv run jupyter notebook

# Run the notebook from top to bottom, then export HTML
export:
    mkdir -p out
    uv run jupyter nbconvert --execute --to html Analysis.ipynb


# Clean output files
clean:
    rm -f *.html *.pdf
    rm -rf .uv_cache