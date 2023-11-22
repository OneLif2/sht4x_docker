/*
 * Copyright (c) 2021, Sensirion AG
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * * Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 *
 * * Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 *
 * * Neither the name of Sensirion AG nor the names of its
 *   contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

//#include <pybind11/pybind11.h>
//#include <pybind11/stl.h>

//namespace py = pybind11;

#include <stdio.h>  // printf
#include <vector>

#include "sensirion_common.h"
#include "sensirion_i2c_hal.h"
#include "sht4x_i2c.h"

/*
 * TO USE CONSOLE OUTPUT (PRINTF) YOU MAY NEED TO ADAPT THE INCLUDE ABOVE OR
 * DEFINE IT ACCORDING TO YOUR PLATFORM:
 * #define printf(...)
 */

std::vector<float> measure_data(std::vector<float> arr) {
    // Read Measurement
    arr[0] = sht4x_measure_high_precision(&arr[1], &arr[2]);
    return arr;
}

int check_serial_number(int16_t& error) {
    uint32_t serial_number;
    error = sht4x_serial_number(&serial_number);
    if (error) {
        printf("Error executing sht4x_serial_number(): %i\n", error);
    } else {
        printf("Serial number: %u\n", serial_number);
    }
    return 0;
}

int main(void) {
    int16_t error = 0;
    float temperature;
    float humidity;
    std::vector<float> arr = {0, 0, 0};
    sensirion_i2c_hal_init();

    check_serial_number(error);

    // Start Measurement
    for (;;) {
        arr = measure_data(arr);
        error = static_cast<int>(arr[0]);
        if (error) {
            printf("Error executing sht4x_measure_high_precision(): %i\n",
                   error);
        } else {
            temperature = arr[1];
            humidity = arr[2];
            printf("Temperature: %0.2f °C, "
                   "Humidity: %0.2f %%RH\n",
                   temperature, humidity);
        }
        sensirion_i2c_hal_sleep_usec(1000000);
    }
    return 0;
}

/*
PYBIND11_MODULE(sht4x, module_handle) {
    module_handle.doc() = "SHT4X PYBIND11";
    module_handle.def("sensirion_i2c_hal_init", &sensirion_i2c_hal_init);
    module_handle.def("check_serial_number", &check_serial_number);
    module_handle.def("measure_data", &measure_data);
    module_handle.def("sht4x_measure_high_precision",
                      &sht4x_measure_high_precision);
    module_handle.def("sensirion_i2c_hal_sleep_usec",
                      &sensirion_i2c_hal_sleep_usec);
}
*/

