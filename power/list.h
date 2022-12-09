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

struct list_node {
    struct list_node* next;
    void* data;
    int (*compare)(void* data1, void* data2);
    void (*dump)(void* data);
};

struct list_node* add_list_node(struct list_node* head, void* data);
int remove_list_node(struct list_node* head, struct list_node* del_node);
struct list_node* find_node(struct list_node* head, void* comparison_data);
