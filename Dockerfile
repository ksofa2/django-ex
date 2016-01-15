FROM python:2.7

COPY requirements.txt /tmp/
WORKDIR /tmp/
RUN pip install -r requirements.txt

RUN mkdir -p /usr/src/app

COPY . /usr/src/app

WORKDIR /usr/src/app/

RUN python manage.py collectstatic --noinput

EXPOSE 8000

CMD python manage.py runserver
