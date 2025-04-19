# Environment Setup for OpenPIV BOS Velocimetry

This document provides instructions for setting up a local conda environment for the OpenPIV BOS Velocimetry project.

## Prerequisites

- Anaconda or Miniconda installed on your system
- Git (for cloning repositories)

## Automatic Setup

We provide a script that automatically sets up the conda environment with all required dependencies:

```bash
# Make the script executable (if not already)
chmod +x setup_env.sh

# Run the setup script
./setup_env.sh
```

The script will:
1. Create a new conda environment named 'schlieren' with Python 3.9
2. Install OpenPIV from conda-forge
3. Install additional dependencies (pivpy, watermark, numpy, matplotlib, etc.)
4. Verify the installation by running a test script

## Manual Setup

If you prefer to set up the environment manually, follow these steps:

```bash
# Create a new conda environment
conda create -n schlieren python=3.9

# Activate the environment
conda activate schlieren

# Install OpenPIV from conda-forge
conda install -c conda-forge openpiv

# Install other dependencies
pip install git+https://github.com/alexlib/pivpy
pip install watermark
pip install numpy matplotlib xarray pandas scikit-image

# Verify the installation
python verify_install.py
```

## Using the Environment

After setup, you can activate the environment with:

```bash
conda activate schlieren
```

Then you can run the Jupyter notebooks:

```bash
jupyter notebook
```

## Troubleshooting

If you encounter any issues during installation:

1. Make sure your conda is up to date: `conda update conda`
2. Try installing packages one by one to identify which one is causing problems
3. Check for any error messages and search for solutions online
4. If OpenPIV installation fails through conda, try: `pip install openpiv`

## Required Packages

The following packages are required for this project:

- openpiv
- pivpy
- numpy
- matplotlib
- xarray
- pandas
- watermark
- scikit-image
