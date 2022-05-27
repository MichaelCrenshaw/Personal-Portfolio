from django.shortcuts import render
from django.views.generic import TemplateView


# home page
class HomePageView(TemplateView):
    template_name = 'homepage.html'
    page_title = 'Home'
    vue_app = 'homepage'


