#!/bin/bash

# Exit on error
set -e

echo "Setting up conda environment for OpenPIV BOS Velocimetry..."

# Create new conda environment named 'schlieren'
echo "Creating conda environment 'schlieren' with Python 3.9..."
conda create -n schlieren python=3.9 -y

# Define a function to activate the environment based on shell type
activate_conda() {
    # Try to detect if we're in a conda environment already
    if [[ -n $CONDA_PREFIX ]]; then
        echo "Activating conda environment 'schlieren'..."
        conda activate schlieren
    else
        # Source the conda.sh script if it exists
        if [[ -f "$CONDA_HOME/etc/profile.d/conda.sh" ]]; then
            . "$CONDA_HOME/etc/profile.d/conda.sh"
            conda activate schlieren
        elif [[ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]]; then
            . "$HOME/miniconda3/etc/profile.d/conda.sh"
            conda activate schlieren
        elif [[ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]]; then
            . "$HOME/anaconda3/etc/profile.d/conda.sh"
            conda activate schlieren
        else
            echo "Could not find conda.sh. Please activate the environment manually:"
            echo "conda activate schlieren"
            exit 1
        fi
    fi
}

# Activate the environment
activate_conda

# Install openpiv from conda-forge (more stable than pip for this package)
echo "Installing OpenPIV from conda-forge..."
conda install -c conda-forge openpiv -y

# Install other requirements using pip
echo "Installing additional dependencies..."
pip install git+https://github.com/alexlib/pivpy
pip install watermark
pip install numpy matplotlib xarray pandas scikit-image

# Verify installation
echo "Verifying installation..."
python verify_install.py

echo "Installation complete! You can now activate the environment with:"
echo "conda activate schlieren"
