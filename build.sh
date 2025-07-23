#!/usr/bin/env bash
# exit on error
set -o errexit

# Create and activate virtual environment
echo "==> Installing requirements"
pip install -r requirements.txt

# Upgrade pip and install requirements
pip install cloudinary django-cloudinary-storage pillow
# Django commands
python manage.py collectstatic --noinput
python manage.py migrate
