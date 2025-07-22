#!/usr/bin/env bash
# exit on error
set -o errexit

# Clean up any existing pip/conda conflicts
rm -rf ~/.cache/pip

# Use system Python rather than Conda to avoid conflicts
pip install --upgrade pip
pip install --no-cache-dir -r requirements.txt

# Add Python user binaries to PATH
export PATH=$PATH:~/.local/bin

# Django deployment commands
python manage.py collectstatic --no-input
python manage.py migrate
