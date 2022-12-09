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

#ifndef ANDROID_HARDWARE_POWER_POWER_H
#define ANDROID_HARDWARE_POWER_POWER_H

#include <aidl/android/hardware/power/BnPower.h>
#include "power-common.h"

namespace aidl {
namespace android {
namespace hardware {
namespace power {
namespace impl {

class Power : public BnPower {
  public:
    Power() : BnPower() { power_init(); }
    ndk::ScopedAStatus setMode(Mode type, bool enabled) override;
    ndk::ScopedAStatus isModeSupported(Mode type, bool* _aidl_return) override;
    ndk::ScopedAStatus setBoost(Boost type, int32_t durationMs) override;
    ndk::ScopedAStatus isBoostSupported(Boost type, bool* _aidl_return) override;
};

}  // namespace impl
}  // namespace power
}  // namespace hardware
}  // namespace android
}  // namespace aidl
#endif  // ANDROID_HARDWARE_POWER_POWER_H
