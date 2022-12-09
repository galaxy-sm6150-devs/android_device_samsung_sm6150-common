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

#define ATTRIBUTE_VALUE_DELIM ('=')
#define ATTRIBUTE_STRING_DELIM (";")

#define METADATA_PARSING_ERR (-1)
#define METADATA_PARSING_CONTINUE (0)
#define METADATA_PARSING_DONE (1)

#define MIN(x, y) (((x) > (y)) ? (y) : (x))

struct video_encode_metadata_t {
    int hint_id;
    int state;
};

struct video_decode_metadata_t {
    int hint_id;
    int state;
};

int parse_metadata(char* metadata, char** metadata_saveptr, char* attribute,
                   unsigned int attribute_size, char* value, unsigned int value_size);
int parse_video_encode_metadata(char* metadata,
                                struct video_encode_metadata_t* video_encode_metadata);
int parse_video_decode_metadata(char* metadata,
                                struct video_decode_metadata_t* video_decode_metadata);
