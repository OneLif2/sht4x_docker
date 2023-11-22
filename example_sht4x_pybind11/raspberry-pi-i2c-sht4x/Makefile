common_sources = sensirion_config.h sensirion_common.h sensirion_common.cpp
i2c_sources = sensirion_i2c_hal.h sensirion_i2c.h sensirion_i2c.cpp
sht4x_sources = sht4x_i2c.h sht4x_i2c.cpp

i2c_implementation ?= sensirion_i2c_hal.cpp

CFLAGS = -g++ -Os -Wall -fstrict-aliasing -Wstrict-aliasing=1 -Wsign-conversion -fPIC -I.

ifdef CI
    CFLAGS += -Werror
endif

.PHONY: all clean

all: sht4x_i2c_example_usage

sht4x_i2c_example_usage: clean
	$(CFLAGS) -o $@  ${sht4x_sources} ${i2c_sources} \
		${i2c_implementation} ${common_sources} sht4x_i2c_example_usage.cpp

clean:
	$(RM) sht4x_i2c_example_usage
