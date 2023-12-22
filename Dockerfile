FROM python:3.8.10-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y python3-smbus

COPY requirements.txt .

RUN pip3 install -r requirements.txt

COPY ./build .
#COPY py_sht4x_read.py .
COPY py_sht4x_LCD.py .

CMD ["python3", "-u", "py_sht4x_LCD.py"]