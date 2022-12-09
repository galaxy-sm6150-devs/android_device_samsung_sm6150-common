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

#ifndef __POWER_COMMON_H__
#define __POWER_COMMON_H__

#ifdef __cplusplus
extern "C" {
#endif

#define INTERACTIVE_GOVERNOR "interactive"
#define SCHEDUTIL_GOVERNOR "schedutil"

#define HINT_HANDLED (0)
#define HINT_NONE (-1)

#include <hardware/power.h>

enum CPU_GOV_CHECK { CPU0 = 0, CPU1 = 1, CPU2 = 2, CPU3 = 3 };

void power_init(void);
void power_hint(power_hint_t hint, void* data);
void set_interactive(int on);

#define ARRAY_SIZE(x) (sizeof((x)) / sizeof((x)[0]))
#define CHECK_HANDLE(x) ((x) > 0)

#ifdef __cplusplus
}
#endif

#endif  //__POWER_COMMON_H___
