import prometheus_client

class Metrics:
    def __init__(self):
        self.temperature = prometheus_client.Gauge("temperature", "The temperature")
        self.humidity = prometheus_client.Gauge("humidity", "The humidity")

        prometheus_client.start_http_server(9090)

    def update_temperature(self, number):
        self.temperature.set(number)

    def update_humidity(self, number):
        self.humidity.set(number)
