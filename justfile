# Install dependencies
install:
    uv sync

# Run Jupyter notebook
notebook:
    uv run jupyter notebook

# Export notebook to HTML
export:
    uv run jupyter nbconvert --to html Analysis.ipynb


# Clean output files
clean:
    rm -f *.html *.pdf
    rm -rf .uv_cache