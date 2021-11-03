#!/bin/bash

set -ex

OUTPUT_DIRECTORY=apps/
rm -rf $OUTPUT_DIRECTORY
mkdir -p $OUTPUT_DIRECTORY
touch $OUTPUT_DIRECTORY/.keep

# TODO: loop over a list of apps

# -------------- Circle CI ------------------

nativefier \
  "https://app.circleci.com" \
  $OUTPUT_DIRECTORY  \
  --internal-urls ".*github.com.* .*s3.amazonaws.com.*" \
  --single-instance \
  --name "Circle CI"

killall "Circle CI" || echo "(warning)"

rm -rf "/Applications/Circle CI.app"
mv "./apps/Circle CI-darwin-x64/Circle CI.app" /Applications

# -------------- Google Calendar ------------------

nativefier \
  "https://calendar.google.com" \
  $OUTPUT_DIRECTORY  \
  --internal-urls ".*okta.com.*" \
  --single-instance \
  --darwin-dark-mode-support \
  --name "Google Calendar"

killall "Google Calendar" || echo "(warning)"

rm -rf "/Applications/Google Calendar.app"
mv "./apps/Google Calendar-darwin-x64/Google Calendar.app" /Applications
