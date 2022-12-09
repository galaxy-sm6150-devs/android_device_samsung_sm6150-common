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
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

#define LOG_TAG "QTI PowerHAL"
#include <hardware/hardware.h>
#include <hardware/power.h>
#include <log/log.h>

#include "hint-data.h"
#include "performance.h"
#include "power-common.h"
#include "utils.h"

static struct hint_handles handles[NUM_HINTS];

void power_init() {
    ALOGI("Initing");

    for (int i = 0; i < NUM_HINTS; i++) {
        handles[i].handle = 0;
        handles[i].ref_count = 0;
    }
}

int __attribute__((weak)) power_hint_override(power_hint_t hint, void* data) {
    return HINT_NONE;
}

void power_hint(power_hint_t hint, void* data) {
    /* Check if this hint has been overridden. */
    if (power_hint_override(hint, data) == HINT_HANDLED) {
        /* The power_hint has been handled. We can skip the rest. */
        return;
    }
    switch (hint) {
        case POWER_HINT_VR_MODE:
            ALOGI("VR mode power hint not handled in power_hint_override");
            break;
        // fall through below, hints will fail if not defined in powerhint.xml
        case POWER_HINT_SUSTAINED_PERFORMANCE:
        case POWER_HINT_VIDEO_ENCODE:
            if (data) {
                if (handles[hint].ref_count == 0)
                    handles[hint].handle = perf_hint_enable((AOSP_DELTA + hint), 0);

                if (handles[hint].handle > 0) handles[hint].ref_count++;
            } else {
                if (handles[hint].handle > 0) {
                    if (--handles[hint].ref_count == 0) {
                        release_request(handles[hint].handle);
                        handles[hint].handle = 0;
                    }
                } else {
                    ALOGE("Lock for hint: %X was not acquired, cannot be released", hint);
                }
            }
            break;
        default:
            break;
    }
}

int __attribute__((weak)) set_interactive_override(int on) {
    return HINT_NONE;
}

#ifdef SET_INTERACTIVE_EXT
extern void power_set_interactive_ext(int on);
#endif

void set_interactive(int on) {
    static int display_hint_sent;

    if (!on) {
    sysfs_write("/sys/class/sec/tsp/input/enabled", "0");
        /* Send Display OFF hint to perf HAL */
        perf_hint_enable(VENDOR_HINT_DISPLAY_OFF, 0);
    } else {
    sysfs_write("/sys/class/sec/tsp/input/enabled", "1");
        /* Send Display ON hint to perf HAL */
        perf_hint_enable(VENDOR_HINT_DISPLAY_ON, 0);
    }

    /**
     * Ignore consecutive display-off hints
     * Consecutive display-on hints are already handled
     */
    if (display_hint_sent && !on) return;

    display_hint_sent = !on;

#ifdef SET_INTERACTIVE_EXT
    power_set_interactive_ext(on);
#endif

    if (set_interactive_override(on) == HINT_HANDLED) {
        return;
    } else {
        ALOGI("Hint not handled in set_interactive_override");
    }
}
