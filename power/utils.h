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

#include <cutils/properties.h>

int sysfs_read(const char* path, char* s, int num_bytes);
int sysfs_write(const char* path, char* s);
int get_scaling_governor(char governor[], int size);
int get_scaling_governor_check_cores(char governor[], int size, int core_num);
int is_interactive_governor(char*);
int is_schedutil_governor(char*);

int perform_hint_action(int hint_id, int resource_values[], int num_resources);
void undo_hint_action(int hint_id);
void undo_initial_hint_action();
void release_request(int lock_handle);
void interaction(int duration, int num_args, int opt_list[]);
int interaction_with_handle(int lock_handle, int duration, int num_args, int opt_list[]);
int perf_hint_enable(int hint_id, int duration);
int perf_hint_enable_with_type(int hint_id, int duration, int type);

long long calc_timespan_us(struct timespec start, struct timespec end);
int get_soc_id(void);
