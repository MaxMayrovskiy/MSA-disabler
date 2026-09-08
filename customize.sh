#!/sbin/sh

LANG_SYS=$(getprop persist.sys.language)

if [ "$LANG_SYS" = "ru" ]; then
    MSG_START_1="--------------------------------------"
    MSG_START_2="       MSA-disabler Installation      "
    MSG_START_3="--------------------------------------"
    MSG_CHECK="- Определение системы..."
    MSG_ERR_1="--------------------------------------"
    MSG_ERR_2="[!] ОШИБКА: У вас установлена кастомная прошивка"
    MSG_ERR_3="[!] Этот модуль предназначен исключительно для MIUI и HyperOS."
    MSG_ERR_4="--------------------------------------"
    MSG_ABORT="Установка отменена."
    MSG_OK="- Обнаружена поддерживаемая система Xiaomi."
    MSG_WARN_1="--------------------------------------"
    MSG_WARN_2="[!] ВНИМАНИЕ: Обнаружен AdAway или сторонний блокировщик!"
    MSG_WARN_3="[!] Использование нескольких монтирований hosts может вызвать конфликты."
    MSG_WARN_4="--------------------------------------"
    MSG_PERM="- Применение правил доступа..."
    MSG_SUCCESS="- Установка успешно завершена!"
else
    MSG_START_1="--------------------------------------"
    MSG_START_2="       MSA Disabler Installation      "
    MSG_START_3="--------------------------------------"
    MSG_CHECK="- Detecting system..."
    MSG_ERR_1="--------------------------------------"
    MSG_ERR_2="[!] ERROR: Custom ROM (AOSP) detected!"
    MSG_ERR_3="[!] This module is designed exclusively for MIUI and HyperOS."
    MSG_ERR_4="--------------------------------------"
    MSG_ABORT="Installation aborted."
    MSG_OK="- Supported Xiaomi system detected."
    MSG_WARN_1="--------------------------------------"
    MSG_WARN_2="[!] WARNING: AdAway or third-party adblocker detected!"
    MSG_WARN_3="[!] Using multiple hosts mounts may cause conflicts."
    MSG_WARN_4="--------------------------------------"
    MSG_PERM="- Applying file permissions..."
    MSG_SUCCESS="- Installation successfully completed!"
fi

ui_print "$MSG_START_1"
ui_print "$MSG_START_2"
ui_print "$MSG_START_3"

IS_MIUI=$(getprop ro.miui.ui.version.name)
IS_HYPEROS=$(getprop ro.hyperos.version)
IS_HYPEROS_ALT=$(getprop ro.our.os.version)

ui_print "$MSG_CHECK"

if [ -z "$IS_MIUI" ] && [ -z "$IS_HYPEROS" ] && [ -z "$IS_HYPEROS_ALT" ]; then
    ui_print "$MSG_ERR_1"
    ui_print "$MSG_ERR_2"
    ui_print "$MSG_ERR_3"
    ui_print "$MSG_ERR_4"
    abort "$MSG_ABORT"
fi

ui_print "$MSG_OK"

if [ -d "/data/data/org.adaway" ] || [ -d "/data/user/0/org.adaway" ] || [ -d "/data/adb/modules/hosts" ]; then
    ui_print "$MSG_WARN_1"
    ui_print "$MSG_WARN_2"
    ui_print "$MSG_WARN_3"
    ui_print "$MSG_WARN_4"
fi

ui_print "$MSG_PERM"

set_perm_recursive $MODPATH 0 0 0755 0644
set_perm $MODPATH/system/etc/hosts 0 0 0644

ui_print "$MSG_SUCCESS"
