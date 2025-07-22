#!/usr/bin/env bash
# exit on error
set -o errexit

mkdir -p static
# Create and activate virtual environment
python -m venv venv
source venv/bin/activate

# Upgrade pip and install requirements
pip install pillow
pip install --upgrade pip
pip install --no-cache-dir -r requirements.txt

# Django commands
python manage.py collectstatic --no-input
python manage.py migrate
