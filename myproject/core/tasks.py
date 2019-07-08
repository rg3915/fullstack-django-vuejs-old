import time
from celery.utils.log import get_task_logger
from celery import shared_task
from django.conf import settings

from myproject.celery import app

logger = get_task_logger(__name__)


@shared_task(queue='fila1')
def print_numbers(max_number):
    logger.info('Creating the task..')

    _sec = 3
    print('Aguardar {} seg'.format(_sec))
    time.sleep(_sec)
    for i in range(max_number):
        print(i)

    logger.info('Finishing task..')
    return True
