from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.urls import reverse
from .tasks import print_numbers


def index(request):
    template_name = 'index.html'
    return render(request, template_name)


def run_task(request):
    print_numbers.delay(10)
    url = 'core:index'
    return HttpResponseRedirect(reverse(url))
