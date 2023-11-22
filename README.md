# sht4x_docker
#sht4x sensor #Docker #Prometheus #Grafana

This project contains a Python script for reading data from the SHT4X sensor.

# Description
The script py_sht4x_read.py is used to continuously read temperature and humidity data from the SHT4X sensor. The data is read in a loop, and if there's an error during the reading process, it's printed to the console. Otherwise, the temperature and humidity values are printed to the console in a formatted manner.

## Getting Started
-----------

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

    