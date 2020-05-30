from django.urls import path
from myproject.core import views as v


app_name = 'core'


urlpatterns = [
    path('api/users/', v.api_users, name='users'),
    path('task/print_numbers/', v.run_task, name='run_task'),
]
