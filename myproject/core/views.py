from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.urls import reverse
from django_celery_results.models import TaskResult
from .tasks import print_numbers


def index(request):
    object_list = TaskResult.objects.all()
    context = {'object_list': object_list}
    template_name = 'index.html'
    return render(request, template_name, context)


def run_task(request):
    print_numbers.delay(10)
    url = 'core:index'
    return HttpResponseRedirect(reverse(url))
