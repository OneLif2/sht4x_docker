import os
import sys
import time

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__))+"/build")

from sht4x import *
import i2c_driver as i2c_driver


from metrics import Metrics # justin
metrics = Metrics() # justin

fontdata1 = [
    # char(0) - degree celsius
    [0x10, 0x06, 0x09, 0x08, 0x08, 0x08, 0x09, 0x06],
    # char(1) - space
    [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00], ]



mylcd = i2c_driver.LCD()
mylcd.lcd_load_custom_chars(fontdata1)
    
humidity, temperature, Temp = 0, 0, 0
humidity1, temperature1, Temp1 = 0, 0, 0
average = [0, 0, 0, 0]
exit1 = 0

temp = 0
hum = 0
error = 0
arr = [error, temp, hum]

sensirion_i2c_hal_init()
check_serial_number(error)

while True:
    arr = measure_data(arr)
    error = arr[0]
    temp = arr[1]
    hum = arr[2]
    metrics.update_temperature(temp) # justin
    metrics.update_humidity(hum) # justin
    #error = sht4x_measure_high_precision(temp, hum)
    if error:
        print("Error executing sht4x_measure_high_precision():", error)
    else:
        print(
            "Temperature= {0:0.2f} °C | Humidity= {1:0.2f} %RH".format(temp, hum))
    mylcd.lcd_display_string(
        "Temp.: {:0.2f}".format(temp)+" ", 1)
    mylcd.lcd_write_char(0)
    mylcd.lcd_write_char(1)
    mylcd.lcd_display_string(
        "Humdty: {:0.2f}".format(hum)+" "+"%  ", 2)
    time.sleep(1)
