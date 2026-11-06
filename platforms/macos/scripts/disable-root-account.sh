#!/bin/sh
# SOC 2 CC6.1, CC6.3 (CIS 5.6): disable the root account.
# Runs automatically when "[SOC 2] macOS - Root account disabled" fails.
# Same effect as `dsenableroot -d`, without needing an admin's credentials.
set -e
/usr/bin/dscl . -delete /Users/root AuthenticationAuthority 2>/dev/null || true
/usr/bin/dscl . -create /Users/root Password '*'
/usr/bin/dscl . -create /Users/root UserShell /usr/bin/false
echo "Root account disabled."
