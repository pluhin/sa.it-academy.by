from django.urls import path
from . import views

app_name = 'authors'

urlpatterns = [
    path('', views.AuthorsIndex.as_view(), name='index'),
    # path('create/', views.create, name='create')
    path('create/', views.AuthorsCreate.as_view(), name='create')
]
