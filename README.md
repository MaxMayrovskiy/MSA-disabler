# MSA-disabler 🚫📱

A Magisk module designed to completely remove system advertisements (**MSA-Global**) on Xiaomi smartphones, bypassing OverlayFS protection.

> ⚠️ **IMPORTANT:** This module is designed **exclusively for Xiaomi devices (including POCO and Redmi)**. The module includes strict device manufacturer verification. Do not try to bypass this check, as it may lead to severe system issues, such as a hard brick or a bootloop!

---

## 🌟 Features

* **Complete MSA Removal:** Deletes MSA-Global subfolders from the system partition, completely clearing the Xiaomi UI from built-in ads.
* **OverlayFS Bypass:** Safely handles and modifies protected directories at the system level.
* **Safe Installation:** Includes automated device verification before flashing to prevent partition damage on non-Xiaomi smartphones.

---

## 📋 Prerequisites

* A **Xiaomi / Redmi / POCO** smartphone
* **Magisk** installed and running (personally tested on POCO M5s, MIUI 14)
* Unlocked bootloader

---

## 🚀 Installation

1. Navigate to the [Releases](https://github.com) section and download the latest `.zip` archive of the module.
2. Open the **Magisk** app on your smartphone.
3. Go to the **Modules** tab at the bottom right.
4. Tap **Install from storage** and select the downloaded `.zip` file.
5. Wait for the device verification and installation processes to finish, then tap **Reboot**.

---

## 🗑️ Uninstallation

If you ever need to remove the module:
1. Open **Magisk** -> **Modules**.
2. Find **MSA-disabler** and tap **Remove**.
3. Reboot your device.

---

## 🤝 Feedback & Contribution

If you encounter any bugs, bootloops, or have suggestions to improve the `customize.sh` script:
1. Open a new [Issue](https://github.com).
2. Clearly state your device model, Android/MIUI/HyperOS version, and attach relevant system logs if possible.

---

## 📄 License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and distribute this code as long as the original authorship is credited.