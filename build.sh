#!/usr/bin/env bash
set -o errexit

# Completely clean the environment
rm -rf ~/.cache/pip
rm -rf ~/.conda

# Create fresh virtual environment
python -m venv venv
source venv/bin/activate

# Install requirements with no cache
pip install --upgrade pip
pip install --no-cache-dir -r requirements.txt

# Django deployment commands
python manage.py collectstatic --no-input
python manage.py migrate
