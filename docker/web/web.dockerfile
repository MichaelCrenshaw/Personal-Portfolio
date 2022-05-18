ARG PYTHON_VERSION=3.10.4

FROM python:$PYTHON_VERSION
ENV PYTHONUNBUFFERED=1
#WORKDIR /app

RUN apt-get install update && apt-get upgrade -y
RUN apt-get install python3.10.4 -y
RUN apt-get install python3-pip -y

COPY ./app /app

RUN pip install -r /app/requirements.txt

RUN python -m manage.py migrate

EXPOSE 8000

#CMD ["python", "manage.py", "runserver"]
CMD ["hypercorn", "--bind", "0.0.0.0:8000", "app.personal_portfolio.asgi:application"]