from django.urls import path
from . import views

app_name = 'homepage'

urlpatterns = [
    path('', views.index_page, name='index'),
    path('articles/', views.articles, name='articles')
]