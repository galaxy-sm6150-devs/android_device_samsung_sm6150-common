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

#include "Power.h"

#include <android-base/logging.h>
#include <android/binder_manager.h>
#include <android/binder_process.h>

using aidl::android::hardware::power::impl::Power;

int main() {
    ABinderProcess_setThreadPoolMaxThreadCount(0);
    std::shared_ptr<Power> vib = ndk::SharedRefBase::make<Power>();
    const std::string instance = std::string() + Power::descriptor + "/default";
    LOG(INFO) << "Instance " << instance;
    if (vib) {
        binder_status_t status = AServiceManager_addService(vib->asBinder().get(), instance.c_str());
        LOG(INFO) << "Status " << status;
        if (status != STATUS_OK) {
            LOG(ERROR) << "Could not register" << instance;
        }
    }

    ABinderProcess_joinThreadPool();
    return 1;  // should not reach
}
