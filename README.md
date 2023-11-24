# sht4x_docker
#sht4x sensor #Docker #Prometheus #Grafana

This project contains a Python script for reading data from the SHT4X sensor.

# Description
The SHT4X series humidity and temperature sensors, renowned for their high accuracy and versatility. These sensors, including models like SHT40, SHT41, and SHT45, offer superior precision and are optimized for low power consumption, making them ideal for diverse applications.

# Lesson 1 Getting Started

### Connecting the Sensor

Your sensor has the four different connectors: VCC, GND, SDA, SCL. Use
the following pins to connect your SHT4x:

 *SHT4x*  |    *Raspberry Pi*
 :------: | :------------------:
   VCC    |        Pin 1 (3.3V)
   GND    |        Pin 6
   SDA    |        Pin 3
   SCL    |        Pin 5

### Installing on Jetson Nano or Raspberry Pi
 - Clone the repository to your local machine.
 - Ensure that Python 3 is installed.
 - Navigate to the driver directory. For example:
    ```bash
    cd ~/sht4x_docker/example_sht4x_pybind11/
    ```
 - Generate the sht4x.cpython-36m-aarch64-linux-gnu.so file. This is a library that is imported in py_sht4x_read.py. Instructions on how to generate this file should be provided here.

    1. Open a terminal
    2. Navigate to the driver directory. E.g. `cd ~/sht4x_docker/example_sht4x_pybind11/`
    3. Run the `setup_pybind11.sh` command to generate the library. 
    
    You may need to change the permissions by running the command:
    ```bash
    chmod +x ./setup_pybind11.sh
    ```
    This shell script will help to run the script below:
    ```bash
    git clone https://github.com/Sensirion/raspberry-pi-i2c-sht4x.git
    git clone https://github.com/pybind/pybind11.git
    mkdir build

    chmod +x cmake.sh
    ./cmake.sh
    ```

    Once the setup scripts are executed, the generated library file `sht4x.cpython-36m-aarch64-linux-gnu.so` will be located in `sht4x_docker/example_sht4x_pybind11/build/`.

## Pybind11 Integration for SHT4X Sensor Control
This project uses Pybind11 to create Python bindings for C++ code, enabling efficient interaction with SHT4X sensors. It compiles C++ functions into a Python module, allowing Python scripts to directly control the sensor hardware with the performance benefits of C++ and the ease of Python.

# Lesson 2 running in Docker

### 2.1 Docker

This project utilizes Docker to ensure a consistent environment for running the Python script. The Dockerfile sets up a lightweight Python environment, installs necessary dependencies, and prepares the script and libraries for execution. The containerized setup simplifies deployment and ensures consistent performance across platforms.

### 2.2 Prometheus

### 2.2 Prometheus

Prometheus, an open-source monitoring tool, excels in collecting and storing time-series data for cloud-native systems. It uses an HTTP pull model for efficient data aggregation and real-time alerting. Widely adopted in the cloud-native ecosystem, Prometheus is essential for monitoring metrics across diverse sources.

### 2.3 Explain build_and_run.sh Script
   ```docker
   docker build . -t sht4x_docker
   docker run                 \
   --name=sht4x_docker        \
   --group-add=dialout      \
   --privileged=true        \
   --restart=unless-stopped \
   -it -d                   \
   -p=30001:9090            \
   sht4x_docker
   ```
- Builds the Docker image with: `docker build . -t sht4x_docker`.
- Runs the container using `docker run` with several options:
  - `--name=sht4x_docker`: Sets the container's name.
  - `--group-add=dialout` and `--privileged=true`: Grants necessary permissions for hardware interaction.
  - `--restart=unless-stopped`: Ensures automatic restart unless explicitly stopped.
  - `-it -d`: Runs the container in detached, interactive mode.
  - `-p=30001:9090`: Maps port 9090 inside the container to port 30001 on the host for Prometheus metrics.



### 2.4 Explain metrics.py

`metrics.py` contains the `Metrics` class, which uses `prometheus_client` to define and update Prometheus metrics for temperature and humidity. It initializes two `Gauge` metrics and starts an HTTP server on port 9090 for Prometheus scraping. The `update_temperature` and `update_humidity` methods set the values for these metrics.



## Acknowledgments

- This project uses libraries from [pybind11](https://github.com/pybind/pybind11) and [Sensirion Raspberry Pi I2C SHT4x](https://github.com/Sensirion/raspberry-pi-i2c-sht4x).
- Special thanks to all contributors who have helped with the development and testing of this project.


## License

This project is licensed under the Apache License 2.0. See the [LICENSE](LICENSE) file for the full license text. The Apache License 2.0 is a permissive open-source license that allows you to freely use, modify, distribute, and sell your software, provided that you include the required notices and do not use the trademarked names in the names of derived products without permission.

qq