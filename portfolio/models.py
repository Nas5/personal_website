from django.db import models
from cloudinary.models import CloudinaryField

class Experience(models.Model):
    title = models.CharField(max_length=200)
    company = models.CharField(max_length=200)
    location = models.CharField(max_length=100)
    start_date = models.DateField()
    end_date = models.DateField(null=True, blank=True)
    description = models.TextField()
    technologies = models.CharField(max_length=500, blank=True)
    
    class Meta:
        ordering = ['-start_date']
    
    def __str__(self):
        return f"{self.title} at {self.company}"

class Project(models.Model):
    title = models.CharField(max_length=200)
    description = models.TextField()
    technologies = models.CharField(max_length=500)
    github_url = models.URLField(blank=True)
    live_url = models.URLField(blank=True)
    image = CloudinaryField('image', blank=True) 
    featured = models.BooleanField(default=False)
    
    def __str__(self):
        return self.title

class Profile(models.Model):
    name = models.CharField(max_length=100)
    title = models.CharField(max_length=200)
    about = models.TextField()
    email = models.EmailField()
    linkedin_url = models.URLField(blank=True)
    github_url = models.URLField(blank=True)
    resume_url = models.URLField(blank=True)
    image = CloudinaryField('image', blank=True) 
    
    def __str__(self):
        return self.name


