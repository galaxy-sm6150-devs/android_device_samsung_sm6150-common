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

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "metadata-defs.h"

int parse_metadata(char* metadata, char** metadata_saveptr, char* attribute,
                   unsigned int attribute_size, char* value, unsigned int value_size) {
    char* attribute_string;
    char* attribute_value_delim;
    unsigned int bytes_to_copy;

    attribute_string = strtok_r(metadata, ATTRIBUTE_STRING_DELIM, metadata_saveptr);

    if (attribute_string == NULL) return METADATA_PARSING_DONE;

    attribute[0] = value[0] = '\0';

    if ((attribute_value_delim = strchr(attribute_string, ATTRIBUTE_VALUE_DELIM)) != NULL) {
        unsigned int attribute_len = (unsigned int)(attribute_value_delim - attribute_string);
        /* copy only attribute len + NUL character, or as much as can be fit */
        bytes_to_copy = MIN(attribute_len + 1, attribute_size);

        strlcpy(attribute, attribute_string, bytes_to_copy);
        strlcpy(value, attribute_value_delim + 1, value_size);
    }

    return METADATA_PARSING_CONTINUE;
}

int parse_video_encode_metadata(char* metadata,
                                struct video_encode_metadata_t* video_encode_metadata) {
    char attribute[1024], value[1024], *saveptr;
    char* temp_metadata = metadata;
    int parsing_status;

    while ((parsing_status = parse_metadata(temp_metadata, &saveptr, attribute, sizeof(attribute),
                                            value, sizeof(value))) == METADATA_PARSING_CONTINUE) {
        if (strlen(attribute) == strlen("hint_id") &&
            (strncmp(attribute, "hint_id", strlen("hint_id")) == 0)) {
            if (strlen(value) > 0) {
                video_encode_metadata->hint_id = atoi(value);
            }
        }

        if (strlen(attribute) == strlen("state") &&
            (strncmp(attribute, "state", strlen("state")) == 0)) {
            if (strlen(value) > 0) {
                video_encode_metadata->state = atoi(value);
            }
        }

        temp_metadata = NULL;
    }

    if (parsing_status == METADATA_PARSING_ERR) return -1;

    return 0;
}

int parse_video_decode_metadata(char* metadata,
                                struct video_decode_metadata_t* video_decode_metadata) {
    char attribute[1024], value[1024], *saveptr;
    char* temp_metadata = metadata;
    int parsing_status;

    while ((parsing_status = parse_metadata(temp_metadata, &saveptr, attribute, sizeof(attribute),
                                            value, sizeof(value))) == METADATA_PARSING_CONTINUE) {
        if (strlen(attribute) == strlen("hint_id") &&
            (strncmp(attribute, "hint_id", strlen("hint_id")) == 0)) {
            if (strlen(value) > 0) {
                video_decode_metadata->hint_id = atoi(value);
            }
        }

        if (strlen(attribute) == strlen("state") &&
            (strncmp(attribute, "state", strlen("state")) == 0)) {
            if (strlen(value) > 0) {
                video_decode_metadata->state = atoi(value);
            }
        }

        temp_metadata = NULL;
    }

    if (parsing_status == METADATA_PARSING_ERR) return -1;

    return 0;
}
