#!/bin/bash

OUTPUT_DIRECTORY=apps/

nativefier \
"https://calendar.google.com" \
$OUTPUT_DIRECTORY  \
--internal-urls "calendar.google.*?" \
--single-instance \
--user-agent "edge" \
--name "Google Calendar"
