#!/system/bin/sh

while [ "$(getprop sys.boot_completed)" != "1" ]; do
  sleep 5
done

PACKAGES="
com.miui.systemAdSolution
com.miui.analytics
com.xiaomi.mipicks
"

for PKG in $PACKAGES; do
  if pm list packages | grep -q "$PKG"; then
    pm disable "$PKG" >/dev/null 2>&1
  fi
done
