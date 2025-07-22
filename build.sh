#!/usr/bin/env bash
set -o errexit

# Clean conda environment
conda clean --all -y
conda config --set pip_interop_enabled True

# Create fresh conda environment
conda create -n myenv python=3.9 -y
conda activate myenv

# Install requirements with conda first, then pip
conda install --file requirements.txt -y || pip install --no-cache-dir -r requirements.txt

# Django commands
python manage.py collectstatic --no-input
python manage.py migrate
