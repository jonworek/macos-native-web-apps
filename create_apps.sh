#!/bin/bash

nativefier "https://calendar.google.com" \
--internal-urls "calendar.google.*?" \
--single-instance \
--user-agent "edge" 
--name "Google Calendar"
