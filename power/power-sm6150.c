/*
** Copyright 2022, The LineageOS Project
**
** Licensed under the Apache License, Version 2.0 (the "License");
** you may not use this file except in compliance with the License.
** You may obtain a copy of the License at
**
**     http://www.apache.org/licenses/LICENSE-2.0
**
** Unless required by applicable law or agreed to in writing, software
** distributed under the License is distributed on an "AS IS" BASIS,
** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
** See the License for the specific language governing permissions and
** limitations under the License.
*/

#define LOG_NIDEBUG 0

#include <dlfcn.h>
#include <errno.h>
#include <fcntl.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

#define LOG_TAG "QTI PowerHAL"
#include <hardware/hardware.h>
#include <hardware/power.h>
#include <log/log.h>

#include "performance.h"
#include "power-common.h"
#include "utils.h"

static int display_fd;
#define SYS_DISPLAY_PWR "/sys/kernel/hbtp/display_pwr"

int set_interactive_override(int on) {
    static const char* display_on = "1";
    static const char* display_off = "0";
    char err_buf[80];
    static int init_interactive_hint = 0;
    int rc = 0;

    if (init_interactive_hint == 0) {
        // First time the display is turned off
        display_fd = TEMP_FAILURE_RETRY(open(SYS_DISPLAY_PWR, O_RDWR));
        if (display_fd < 0) {
            strerror_r(errno, err_buf, sizeof(err_buf));
            ALOGE("Error opening %s: %s\n", SYS_DISPLAY_PWR, err_buf);
        } else
            init_interactive_hint = 1;
    } else if (!on) {
        /* Display off */
        rc = TEMP_FAILURE_RETRY(write(display_fd, display_off, strlen(display_off)));
        if (rc < 0) {
            strerror_r(errno, err_buf, sizeof(err_buf));
            ALOGE("Error writing %s to  %s: %s\n", display_off, SYS_DISPLAY_PWR, err_buf);
        }
    } else {
        /* Display on */
        rc = TEMP_FAILURE_RETRY(write(display_fd, display_on, strlen(display_on)));
        if (rc < 0) {
            strerror_r(errno, err_buf, sizeof(err_buf));
            ALOGE("Error writing %s to  %s: %s\n", display_on, SYS_DISPLAY_PWR, err_buf);
        }
    }
    return HINT_HANDLED;
}

int power_hint_override(power_hint_t hint, void* data) {
    int ret_val = HINT_NONE;
    switch (hint) {
        case POWER_HINT_INTERACTION: {
            int resources[] = {MIN_FREQ_LITTLE_CORE_0, 0x514};
            int duration = 100;
            interaction(duration, ARRAY_SIZE(resources), resources);
            ret_val = HINT_HANDLED;
        }
        default:
            break;
    }
    return ret_val;
}
