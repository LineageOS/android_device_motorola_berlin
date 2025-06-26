/*
 * SPDX-FileCopyrightText: The LineageOS Project
 * SPDX-License-Identifier: Apache-2.0
 */

#define LOG_TAG "vendor.lineage.touch-service.berlin"

#include "HighTouchPollingRate.h"
#include "KeyDisabler.h"
#include "KeySwapper.h"

#include <android-base/logging.h>
#include <android/binder_manager.h>
#include <android/binder_process.h>

using aidl::vendor::lineage::touch::HighTouchPollingRate;

int main() {
    binder_status_t status = STATUS_OK;

    ABinderProcess_setThreadPoolMaxThreadCount(0);

    std::shared_ptr<HighTouchPollingRate> htpr = ndk::SharedRefBase::make<HighTouchPollingRate>();
    const std::string htpr_instance = std::string(HighTouchPollingRate::descriptor) + "/default";
    status = AServiceManager_addService(htpr->asBinder().get(), htpr_instance.c_str());
    CHECK_EQ(status, STATUS_OK) << "Failed to add service " << htpr_instance << " " << status;

    ABinderProcess_joinThreadPool();
    return EXIT_FAILURE;  // should not reach
}
