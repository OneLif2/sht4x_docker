FROM python:3.6.9-slim

WORKDIR /app

COPY requirements.txt .

RUN pip3 install -r requirements.txt

COPY ./build .
COPY metrics.py .
#COPY py_sht4x_read.py .
COPY py_sht4x_LCD.py .

CMD ["python3", "-u", "py_sht4x_LCD.py"]