FROM python:3.9.7-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip install --upgrade pip && pip3 install -r requirements.txt

COPY . .

EXPOSE 5000

CMD [ "gunicorn", "--bind" , "0.0.0.0:5000", "--access-logfile", "-", "--error-logfile", "-", "app:app"]