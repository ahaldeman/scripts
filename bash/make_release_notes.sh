#!/usr/bin/bash

check_for_pivotal_tracker_api_token() {
    if [[ -z "${PIVOTAL_TRACKER_API_TOKEN}" ]]; then
        echo "Missing PIVOTAL_TRACKER_API_TOKEN"
        exit 1
    fi
}

make_release_notes() {
    $(check_for_pivotal_tracker_api_token)
}

make_release_notes
