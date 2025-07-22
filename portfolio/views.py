from django.shortcuts import render
from .models import Profile, Experience, Project

def index(request):
    try:
        profile = Profile.objects.first()
    except Profile.DoesNotExist:
        profile = None
    
    experiences = Experience.objects.all()
    projects = Project.objects.filter(featured=True)
    
    context = {
        'profile': profile,
        'experiences': experiences,
        'projects': projects,
    }
    return render(request, 'portfolio/index.html', context)