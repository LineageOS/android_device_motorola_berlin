/*
 * SPDX-FileCopyrightText: The LineageOS Project
 * SPDX-License-Identifier: Apache-2.0
 */

#pragma once

#include <aidl/vendor/lineage/touch/BnHighTouchPollingRate.h>

#define HTPR_CONTROL_PATH "/sys/class/touchscreen/primary/interpolation"

namespace aidl {
namespace vendor {
namespace lineage {
namespace touch {

class HighTouchPollingRate : public BnHighTouchPollingRate {
  public:
    ndk::ScopedAStatus getEnabled(bool* _aidl_return) override;
    ndk::ScopedAStatus setEnabled(bool enabled) override;
};

}  // namespace touch
}  // namespace lineage
}  // namespace vendor
}  // namespace aidl
