from django.shortcuts import render
from django.views.generic import TemplateView


# home page
class HomePageView(TemplateView):
    template_name = 'homepage.html'
    page_title = 'Home'
    vue_app = 'homepage'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['page_title'] = self.page_title
        context['vue_app'] = self.vue_app
        return context


def serve_vue(request):
    return render(request, template_name='vue.html')
