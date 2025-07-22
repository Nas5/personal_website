
# portfolio/templatetags/__init__.py
# This file must exist (can be empty) to make Python treat the directory as a package

# portfolio/templatetags/custom_filters.py
from django import template

register = template.Library()

@register.filter
def split(value, key):
    """
    Returns the value turned into a list by splitting on the given character.
    Usage: {{ "a,b,c"|split:"," }}
    """
    if not value:
        return []
    return value.split(key)

@register.filter
def trim(value):
    """
    Removes whitespace from the beginning and end of the string.
    Usage: {{ "  hello  "|trim }}
    """
    if not value:
        return value
    return value.strip()
