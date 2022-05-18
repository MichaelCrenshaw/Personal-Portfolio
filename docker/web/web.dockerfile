ARG PYTHON_VERSION=3.10.4-bullseye

FROM python:$PYTHON_VERSION
ENV PYTHONUNBUFFERED=1
WORKDIR /app

RUN apt-get update && apt-get upgrade -y
RUN #apt-get install python3.10 -y
RUN #apt-get install python3-pip -y

COPY requirements.txt /app
RUN python -m pip install -r requirements.txt

COPY . /app

RUN python manage.py migrate

EXPOSE 8000

#CMD ["python", "manage.py", "runserver"]
CMD ["hypercorn", "--bind", "0.0.0.0:8000", "personal_portfolio.asgi:application"]