import sys
import importlib

# List of required packages
required_packages = [
    'openpiv',
    'pivpy',
    'numpy',
    'matplotlib',
    'xarray',
    'pandas',
    'watermark',
    'scikit-image'
]

all_installed = True

print("Checking required packages...\n")
print(f"Python version: {sys.version}\n")

for package in required_packages:
    try:
        module = importlib.import_module(package)
        version = getattr(module, '__version__', 'unknown')
        print(f"✓ {package} version: {version}")
    except ImportError:
        print(f"✗ {package} is NOT installed!")
        all_installed = False

print("\n" + "-"*50)
if all_installed:
    print("\n✓ All required packages are installed! You're ready to go!")
else:
    print("\n✗ Some packages are missing. Please install them before proceeding.")