"""
Local URL Configs file for main site, contains pages relating to about me, contact me, other text-heavy portfolio pages

Pages here are more blog-like than showcase-like, and are meant to be used as a read-only set of pages.
Any pages that:
    showcase code,
    are heavily interactive,
    describe site structure in detail,
    or show off a particular sub-project
should not be included here, and instead deserve their own app.

I consider it code duplication to write comments describing what a page's content is.
Page details are not commented here, complex features will be documented in their respective pages.

If you've read this far into my code, consider contacting me about anything in particular:
    If you're a recruiter that is this interested in my code indentations, then I want to talk to you
    If you are starting to code and want to get a feel for my code style, then I want to talk to you
    If you are calling about my car's extended warranty, maybe you should stop reading.
"""


from django.urls import path
from . import views

from django.conf.urls.static import static

urlpatterns = [
    path('', views.HomePageView.as_view(), name='Homepage'),
]

