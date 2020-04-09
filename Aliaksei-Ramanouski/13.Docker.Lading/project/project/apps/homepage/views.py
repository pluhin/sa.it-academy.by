from django.shortcuts import render
from django.http import HttpResponse
# Create your views here.

def index_page(request):
    #return HttpResponse('<h1>WELCOME TO INDEX OF HOMEPAGE!!!</h1>')
    return render(request, 'homepage/index.html')

def articles(request):
    #return HttpResponse('Articles', content_type='text/html')
    args = {
        'numbers_of_articles': list(range(1, 8))
    }
    return render(request, 'homepage/articles.html', args)
