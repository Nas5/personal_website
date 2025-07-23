#!/usr/bin/env bash
# exit on error
set -o errexit

mkdir -p static
# Create and activate virtual environment
echo "==> Installing requirements"
pip install --upgrade pip
pip install -r requirements.txt


echo "==> Checking installed packages"
pip list | grep gunicorn


# Upgrade pip and install requirements
pip install pillow
pip install gunicorn
pip install --upgrade pip
pip install --no-cache-dir -r requirements.txt

# Django commands
python manage.py collectstatic --no-input
python manage.py migrate
