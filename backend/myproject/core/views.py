from django.contrib.auth.models import User
from django.http import HttpResponseRedirect
from django.http import JsonResponse
from django.urls import reverse
# from django_celery_results.models import TaskResult
from .tasks import print_numbers


def api_users(request):
    users = User.objects.all()
    data = [
        {'username': user.username}
        for user in users
    ]
    response = {'data': data}
    return JsonResponse(response)


def run_task(request):
    print_numbers.delay(10)
    url = 'core:index'
    return HttpResponseRedirect(reverse(url))
