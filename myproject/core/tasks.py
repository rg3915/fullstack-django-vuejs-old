import time
from celery.utils.log import get_task_logger
from django.conf import settings

from mail.celery import app

logger = get_task_logger(__name__)

# Testar com @shared_task(queue='fila1')


@app.task(name="print_numbers_task")
def print_numbers(max_number):
    logger.info('Creating the task..')

    _sec = 5
    print('Aguardar {} seg'.format(_sec))
    time.sleep(_sec)
    for i in range(max_number):
        print(i)

    logger.info('Finishing task..')
