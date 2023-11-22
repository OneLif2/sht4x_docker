# program for testing grippper status
import os
import sys
# Append parent directory to import path, import file from parent directory
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__))+"/build")

#print(__file__) #./file.py
#print(os.path.abspath(__file__)) #./file.py
print(os.path.dirname(os.path.abspath(__file__))) #./

from sht4x import *
import time

class SHT4X(object):
    def __init__(self):
        self.temp = 0
        self.hum = 0
        self.error = 0
        self.arr = [self.error, self.temp, self.hum]
        sensirion_i2c_hal_init()
        check_serial_number(self.error)

def main():
    while True:
        sht.arr = measure_data(sht.arr) 
        sht.error = sht.arr[0]
        sht.temp = sht.arr[1]
        sht.hum = sht.arr[2]
        #error = sht4x_measure_high_precision(temp, hum)
        if sht.error:
            print("Error executing sht4x_measure_high_precision():", sht.error)
        else:
            print(
                "Temperature= {0:0.2f} °C | Humidity= {1:0.2f} %RH".format(sht.temp, sht.hum))
        time.sleep(1)

if __name__ == "__main__":
    sht = SHT4X()
    main()