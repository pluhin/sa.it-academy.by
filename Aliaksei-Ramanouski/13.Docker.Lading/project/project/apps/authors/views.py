from django.shortcuts import render,redirect, reverse
from django.views.generic import TemplateView
from django.views.generic import ListView
from .models import Author
from .forms import AuthorForm

class AuthorsIndex(ListView):

    model = Author
    context_object_name = 'authors'

    template_name = 'authors/index.html'

    # def get_queryset(self):
    #     return super().get_queryset().filter(email__endswith='com')

# def create(request):
#     return render(request, 'authors/create.html')

class AuthorsCreate(TemplateView):

    template_name = 'authors/create.html'
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['form'] = AuthorForm()
        return context
    
    def post(self, request):
        form = AuthorForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('authors:index')  

        return render(request, self.template_name, {'form': form})
