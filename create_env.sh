# Create new conda environment named 'schlieren'
conda create -n schlieren python=3.11 --yes

# Activate the environment
conda activate schlieren

# Install openpiv from conda-forge (more stable than pip for this package)
pip install openpiv 

# Install other requirements using pip
pip install git+https://github.com/alexlib/pivpy
pip install watermark